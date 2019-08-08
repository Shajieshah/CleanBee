# frozen_string_literal: true

class Vendors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :valid_resource?, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def valid_resource?
    
    vendor = Vendor.find_by(email: params[:vendor][:email])

    unless vendor
      redirect_to new_session_path(resource_name), :flash => { :error => "Account not found" } and return
    end

  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
