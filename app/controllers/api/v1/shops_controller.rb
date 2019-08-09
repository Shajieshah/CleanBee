module Api::V1
	class ShopsController < ApiController

		before_action :verify_user_logged_in?

		def show
			@shop = Shop.find_by(id: params[:id])
		end

		def index
			laundry_ids_array = params[:laundry_id].split(',')
			@shops = ShopService.where(laundry_id: laundry_ids_array)
		end

	end
end