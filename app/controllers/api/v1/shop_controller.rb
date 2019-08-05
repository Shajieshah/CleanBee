module Api::V1
	class ShopController < ApiController

		include ApplicationHelper
		include ShopHelper
		before_action :verify_user_logged_in?

		def index
		end

		def search_shops
			@shops = ShopService.where(laundry_id: params[:laundry_id])
		end

	end
end