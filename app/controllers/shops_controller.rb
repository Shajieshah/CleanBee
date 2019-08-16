class ShopsController < ApplicationController
	before_action :authenticate_vendor!
	

	def show
	end

	def edit
		@shop = current_vendor.shop
	end

	def update
		byebug
	end

	private

	def shop_params
		params.require(:shop).permit(:name, :description, :opening_time, :closing_time, :address, :image)
	end

end