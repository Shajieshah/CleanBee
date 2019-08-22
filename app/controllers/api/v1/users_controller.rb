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

    def favourite_shops
      @shops = current_user.favourite_shops
    end

    def add_shop_to_favourite
      begin
        if params[:favourite] == "true" or params[:favourite] == true
          FavouriteShop.create!(user_id: current_user.id, shop_id: params[:shop_id])
          render_success_response 'shop added to favourite list'
        else
          favourite_shop = FavouriteShop.where(user_id: current_user.id, shop_id: params[:shop_id]).first
          favourite_shop.destroy!
          render_success_response 'shop removed favourite list'
        end
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