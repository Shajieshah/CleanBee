class Api::V1::ReportedOrdersController < InheritedResources::Base

  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :verify_user_logged_in?

  def create
    begin
      reported_order = @current_user.reported_orders.new reported_order_params
      reported_order.save!
      render_success "Order reported successfullt", 200
    rescue => error
      render_error error.message, 400
    end
  end

  private

  def reported_order_params
    params.require(:reported_order).permit(:user_id, :order_id, :reason, :notes)
  end

end
