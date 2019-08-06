# frozen_string_literal: true

class Vendors::PasswordsController < Devise::PasswordsController
  # before_action :check_vendor_exist, only: [:create]
  # GET /resource/password/new
  # def new
  #   super
  # end

  def create
    
    vendor = Vendor.find_by(email: params[:vendor][:email])

    unless vendor
      redirect_to new_password_path(resource_name), :flash => { :error => "Account not found" } and return
    end

    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  protected

  # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      # new_session_path(resource_name) if is_navigational_format?
      new_session_path(resource_name)
    end

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

end
