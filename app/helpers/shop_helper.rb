module ShopHelper


	def validate_request
		
	end

	def missing_params
		render json: {
			success: false,
			message: 'Request missing required parameters'
		}, status: 400
	end

end