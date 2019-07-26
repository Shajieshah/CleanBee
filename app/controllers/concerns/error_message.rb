module ErrorMessage

  def validate_sign_up_request
    if params[:user] && params[:user][:email].present? && params[:user][:password].present? && params[:user][:password_confirmation].present? && params[:user][:user_name].present? && params[:user][:phone].present?
      return resource_already_exist_error if user_already_exist?
    else
      bad_request_error("Missing required parameters", 400)
    end
  end

  def validate_sign_in_params
    if params[:user][:email].present? && params[:user][:phone].present?
      @resource = User.email_or_phone_exist?(params[:user][:email], params[:user][:phone]).first
      bad_request_error("User not found", 200) and return unless @resource.present?
    else
      bad_request_error("Missing required parameters", 400)
    end
  end

  def validate_account_update_request
    if params[:user][:email].present? || params[:user][:phone].present?
      users = User.where.not(id: current_user.id)
      taken = users.where("email = ? OR  phone = ? ", params[:user][:email], params[:user][:phone])
      return resource_already_exist_error if taken
    else
      bad_request_error("Missing required parameters", 400)
    end
  end

  def user_already_exist?
    user = User.email_or_phone_exist?(params[:user][:email], params[:user][:phone]).first
    true if user.present?
  end

  def bad_request_error(message, status)
    render json: {
        success: false,
        message: message,
    }, status: status
  end

  def render_sucessfull_message(message, status)
    render json: {
        success: true,
        message: message,
    }, status: status
  end

  def resource_already_exist_error
    render json: {
        success: false,
        message: "Email or Phone Number already taken"
    }, status: 200
  end

end
