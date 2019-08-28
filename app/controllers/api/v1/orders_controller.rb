class Api::V1::OrdersController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :verify_user_logged_in?


  def index
    if current_user.role.eql? "customer"
      if params[:ongoing]
        @orders = @current_user.owned_orders.where(status: ["assigned", "processing"])
      elsif params[:scheduled]
        @orders = @current_user.owned_orders.where(status: "pending")
      else
        @orders = @current_user.owned_orders.where(status: "completed")
      end
    else
      # current_user.role.eql? "rider"

      if params[:open]
        @orders = Order.where(status: "pending").near([current_user.latitude, current_user.longitude], 5)
      elsif params[:assigned]
        @orders = @current_user.assigned_orders.where(status: ['assigned', 'picked_up_from_customer',
                                                               'dropped_to_vendor', 'ready_to_deliver',
                                                               "picked_up_from_vendor"]).joins(:laundries)
      else
        @orders = @current_user.assigned_orders.where(status: "completed").joins(:laundries)
      end
    end

  end

  def show
    begin
      @order = Order.find_by(id: params[:id])
      if @order.present?
      else
        render_error "Order not found", 400
      end
    rescue => error
      render_error error.message, 400
    end
  end

  def create
    begin
      @order = @current_user.owned_orders.new order_params
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
        render_success "Order_status_updated successfully", 200
      end
    rescue => error
      render_error error.message, 200
    end

  end


  private

  def order_params
    params.fetch(:order, {}).permit(:shop_id, :owner_id, :assignee_id, :order_type, :pick_location, :pickup_time,
                                    :pickup_date, :pick_lat, :pick_lng, :delivery_time, :delivery_date,
                                    :laundries, :status)
  end

end
