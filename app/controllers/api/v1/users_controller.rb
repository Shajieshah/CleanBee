module Api::V1
  class UsersController < ApiController

    # before_action :authenticate_user!
    before_action :verify_user_logged_in?

    def show
      @profile = current_user
    end

    def verify_user
      begin
        current_user.update(phone_verified: params[:phone_verified])
        render_success("Profile updated successfully.", 200)
      rescue => error
        render_error error.message, 400
      end
    end

    def get_favourite_shops
      @shops = current_user.favourite_shops
    end

    def add_shop_to_favourite
      begin
        already_exist = FavouriteShop.where(user_id: current_user.id, shop_id: params[:shop_id]).first
        FavouriteShop.create(user_id: current_user.id, shop_id: params[:shop_id]) unless already_exist
        render_success_response 'shop added to favourite list'
      rescue => error
        bad_request_error error.message
      end
    end

    def remove_shop_from_favourite
      begin
        favourite_shop = FavouriteShop.where(user_id: current_user.id, shop_id: params[:shop_id]).first
        render_success_response 'shop removed from favourite list' if favourite_shop.destroy
      rescue => error
        bad_request_error error.message
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :user_name, :phone, :image, :role, :address,
                                   :ride, :latitude, :longitude)
    end

  end
end