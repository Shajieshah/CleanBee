module Api::V1
	class UsersController < ApiController

		before_action :authenticate_user!
		include ApplicationHelper

		def verify_user
			begin
				user = User.find_by(id: params[:id])
				if params[:phone_verified].present?
					if user.phone_verified?
						render_error "User's phone is already verified", 422
					else
						user.phone_verified = params[:phone_verified]
						render_success "User's Phone verified successfully", 200 if user.save!
					end
				else
					render_error 'Missing Required Parameters', 400
				end
			rescue error
				render_error error.message, 422
			end
		end
		
		def user_profile
			@profile = current_user
		end

		private

		def user_params
			params.require(:user).permit(:email, :user_name, :phone, :image, :role, :address,
                                   :ride, :latitude, :longitude )
		end
		
	end
end