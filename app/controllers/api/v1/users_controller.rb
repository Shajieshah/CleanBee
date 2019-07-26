module Api::V1
	class UsersController < ApiController

		before_action :authenticate_user!
		include ApplicationHelper

		def verify_user
			begin
				user = User.find_by(id: params[:id])
				user.phone_verified = params[:phone_verified]
				render_success "User's Phone verified successfully", 200 if user.save!
			rescue error
				render_error error.message, 422
			end
		end
		
		private

		def user_params
			params.require(:user).permit(:email, :user_name, :phone, :image, :role, :address,
                                   :ride, :latitude, :longitude )
		end
	end
end