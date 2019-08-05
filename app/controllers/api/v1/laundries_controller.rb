module Api::V1
	class LaundriesController < ApiController
		
		before_action :verify_user_logged_in?

		def index
			@laundries = Laundry.all
		end

	end
end