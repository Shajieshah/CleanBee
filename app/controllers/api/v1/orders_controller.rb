class Api::V1::OrdersController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :verify_user_logged_in?

  def show
    @order = Order.find_by(id: params[:id])
    render :'api/v1/order/show'
  end

  def create
    begin
      @order = @current_user.orders.new order_params
      if @order.save!
        @order_cost = 0
        params[:laundries].each do |laundry_hash|
          laundry = Laundry.find_by(id: laundry_hash[:id])
          @order.order_laundries.create(laundry_id: laundry.id, cost: laundry_hash[:cost])
          @order_cost = @order_cost + laundry_hash[:cost]
          laundry_hash[:capabilities].each do |capability|
            capability = Capability.find_by(id: capability[:id])
            laundry.laundry_capabilities.create(capability_id: capability.id)
          end
        end
        @order.update(cost: @order_cost)
      end
      render_success "Order created successfully", 200
    rescue => error
      render_error error.message, 200
    end

  end


  private

  def order_params
    params.fetch(:order, {}).permit(:shop_id, :order_type, :pick_location, :pickup_time,
                                    :pickup_date, :delivery_time, :delivery_date, :laundries)
  end

end
