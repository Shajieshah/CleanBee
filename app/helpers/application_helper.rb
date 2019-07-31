module ApplicationHelper

	def verify_user_logged_in?
		render json: {
			success: false,
			message: 'You need to sign in or sign up before continuing.'
		}, status: 401 and return unless user_signed_in?
	end

	def render_success(message, status)
		render json: {
			success: true, 
			message: message
		}, status: status
	end

	def render_error(message, status)
		render json: {
			success: false, 
			message: message
		}, status: status
	end

end