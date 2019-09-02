class Api::V1::NotificationsController < InheritedResources::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ErrorMessage
  before_action :verify_user_logged_in?

  def index
    @notifications = @current_user.notifications
  end

  private

    def notification_params
      params.require(:notification).permit(:user_id, :message)
    end

end
