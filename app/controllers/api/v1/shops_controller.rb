module Api::V1
  class ShopsController < ApiController

    before_action :verify_user_logged_in?

    def show
      @shop = Shop.find_by(id: params[:id])
    end

    def search_shops
      if params[:top_rated].present?
        laundry_ids_array = params[:laundry_id].split(',')
        @shops = ShopService.where(laundry_id: laundry_ids_array)
      elsif params[:nearby].present?

      else
        laundry_ids_array = params[:laundry_id].split(',')
        @shops = ShopService.where(laundry_id: laundry_ids_array)
        @fav_shops = @current_user.favourite_shops.pluck(:shop_id)
      end

    end

  end
end