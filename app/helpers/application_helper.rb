module ApplicationHelper

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