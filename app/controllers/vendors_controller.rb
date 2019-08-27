class VendorsController < ApplicationController

  before_action :authenticate_vendor!

  def dashboard
    @new_orders = current_vendor.shop.orders.where(status: "pending").count
    @ongoing_orders = current_vendor.shop.orders.where(status: ['assigned', 'picked_up_from_customer',
                                                                'dropped_to_vendor', 'ready_to_deliver',
                                                                'picked_up_from_vendor']).count
    @completed_orders = current_vendor.shop.orders.where(status: "completed").count
  end

end