class Api::V1::RatingsController < InheritedResources::Base

  include DeviseTokenAuth::Concerns::SetUserByToken
  include ErrorMessage
  before_action :verify_user_logged_in?

  def create
    begin
      @shop = Shop.find_by_id params[:rating][:shop_id]
      @rating = @current_user.ratings.new rating_params
      @rating.save!
      rating_count = @shop.ratings.count
      total_rating = @shop.ratings.sum(:rating)
      average_rating = total_rating / rating_count
      @shop.update(rating: average_rating)
      render_success 'Rating added successfully', 200
    rescue => error
      bad_request_error(error.message, 400)
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :shop_id, :review)
  end

end
