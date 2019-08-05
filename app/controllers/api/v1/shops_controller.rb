module Api::V1
	class ShopsController < ApplicationController

		include ShopHelper
		include DeviseTokenAuth::Concerns::SetUserByToken
		before_action :verify_user_logged_in?

		def index
		end

		def show
			@shop = Shop.find_by(id: params[:id])
		end

		def search_shops
			laundry_ids_array = params[:laundry_id].split(',')
			@shops = ShopService.where(laundry_id: laundry_ids_array)
		end

	end
end