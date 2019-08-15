class ShopsController < ApplicationController
	before_action :authenticate_vendor!
	

	def show
	end

	def edit
	end

	def update
	end

	private

	def shop_params
		params
	end

end