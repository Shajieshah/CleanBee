class Api::V1::OrdersController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :verify_user_logged_in?


  def index
    if params[:ongoing]
      @orders = @current_user.orders.where(status: ["assigned", "processing"]).joins(:laundries)
    elsif params[:scheduled]
      @orders = @current_user.orders.where(status: "open").joins(:laundries)
    elsif params[:history]
      @orders = @current_user.orders.where(status: "completed").joins(:laundries)
    else
      @orders = @current_user.orders.where(status: "pending").joins(:laundries)
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    begin
      @order = @current_user.orders.new order_params
      @order.shop_id = params[:order][:shop_id]
      if @order.save!
        @order_cost = 0
        params[:order][:laundries].each do |laundry_hash|
          laundry = Laundry.find_by(id: laundry_hash[:id])
          @order.order_laundries.create(laundry_id: laundry.id, cost: laundry_hash[:cost], notes: laundry_hash[:notes])
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

  def update
    begin
      @order = Order.find_by_id params[:id]
      if @order.update(order_params)
        render_success "Order update successfully", 200
      end
    rescue => error
      render_error error.message, 200
    end

  end


  private

  def order_params
    params.fetch(:order, {}).permit(:shop_id, :order_type, :pick_location, :pickup_time,
                                    :pickup_date, :delivery_time, :delivery_date, :laundries, :status)
  end

end
