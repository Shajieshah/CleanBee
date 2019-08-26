class VendorsController < ApplicationController

	before_action :authenticate_vendor!
	
	def dashboard
		puts 'ok'
		@new_orders = current_vendor.shop.orders.where(status: "pending").count
		@ongoing_orders = current_vendor.shop.orders.where(status: "pending").count

	end

end