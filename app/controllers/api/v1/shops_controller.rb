module Api::V1
  class ShopsController < ApiController

    before_action :verify_user_logged_in?

    def show
      begin
        @shop = Shop.find_by(id: params[:id])
        if @shop.present?
        else
          render_error "Shop not found", 400
        end
      rescue => error
        render_error error.message, 400
      end
    end

    def search_shops
      begin
        if params[:top_rated].present?
          laundry_ids_array = params[:laundry_id].split(',')
          @shops = ShopService.where(laundry_id: laundry_ids_array)
        elsif params[:nearby].present?

        else
          laundry_ids_array = params[:laundry_id].split(',')
          @shops = ShopService.where(laundry_id: laundry_ids_array)
        end
      rescue => error
        render_error error.message, 400
      end
    end

  end
end