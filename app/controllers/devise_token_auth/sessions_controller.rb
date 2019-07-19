# frozen_string_literal: true

# see http://www.emilsoman.com/blog/2013/05/18/building-a-tested/
module DeviseTokenAuth
  class SessionsController < DeviseTokenAuth::ApplicationController
    include ErrorMessage
    before_action :set_user_by_token, only: :destroy
    # before_action :validate_sign_in_params, only: :create
    after_action :reset_session, only: :destroy

    def new
      render_new_error
    end

    def update_header_tokens
      @client_id, @token = @resource.create_token
      @resource.save!
      update_auth_header
    end

    def create
      begin
        if params[:user][:provider].eql? "email"
          @resource = User.exist?(params[:user][:email]).first
          return bad_request_error("User not found", 200) unless @resource.present?
          if @resource.valid_password? params[:user][:password]
            @profile = @resource.profile
            @client_id, @token = @resource.create_token
            @resource.save
            @resource.profile.update(fcm: params[:fcm]) if params[:fcm].present?
            yield @resource if block_given?
            render :log_in, status: :ok
          else
            bad_request_error("Invalid Login Credentials", 200)
          end

        elsif params[:user][:provider].eql? "facebook"
          @resource = User.where('email = ? OR facebook_id = ?', "#{params[:user][:email]}", "#{params[:user][:facebook_id]}").first
          @profile = @resource.profile if @resource.present?
          update_header_tokens if @resource.present?
          return render :log_in if @resource.present?
          @resource = User.create(email: params[:user][:email], facebook_id: params[:user][:facebook_id],
                                  uid: params[:user][:email], provider: "facebook",
                                  user_name: params[:user][:user_name], confirmed_at: Time.now)

          @profile = Profile.create(name: "", about: "", country: "", fcm: params[:fcm], user_id: @resource.id)
          communities = Community.where(default: true).limit(5)
          communities.each do |community|
            @resource.follow(community)
            CommunityUser.create(user_id: @resource.id, community_id: community.id, role: "user")
          end
          @client_id, @token = @resource.create_token
          @resource.save!
          update_auth_header
          render :log_in

        else
          @resource = User.where('user_name = ? AND provider = ?', "#{params[:user][:user_name]}", "#{params[:user][:provider]}").first
          @profile = @resource.profile if @resource.present?
          update_header_tokens if @resource.present?
          return render :log_in if @resource.present?
          @resource = User.create(email: params[:user][:email], uid: params[:user][:email], provider: "instagram",
                                  user_name: params[:user][:user_name], confirmed_at: Time.now)

          @profile = Profile.create(name: "", about: "", country: "", fcm: params[:fcm], user_id: @resource.id)
          communities = Community.where(default: true).limit(5)
          communities.each do |community|
            @resource.follow(community)
            CommunityUser.create(user_id: @resource.id, community_id: community.id, role: "user")
          end
          @client_id, @token = @resource.create_token
          @resource.save!
          update_auth_header
          render :log_in
        end
      rescue => error
        bad_request_error(error.message, 200)
      end
    end

    def destroy
      # remove auth instance variables so that after_action does not run
      user = remove_instance_variable(:@resource) if @resource
      client_id = remove_instance_variable(:@client_id) if @client_id
      remove_instance_variable(:@token) if @token

      if user && client_id && user.tokens[client_id]
        user.tokens.delete(client_id)
        user.save!

        yield user if block_given?

        render_destroy_success
      else
        render_destroy_error
      end
    end

    protected

    def valid_params?(key, val)
      resource_params[:password] && key && val
    end

    def get_auth_params
      auth_key = nil
      auth_val = nil

      # iterate thru allowed auth keys, use first found
      resource_class.authentication_keys.each do |k|
        if resource_params[k]
          auth_val = resource_params[k]
          auth_key = k
          break
        end
      end

      # honor devise configuration for case_insensitive_keys
      if resource_class.case_insensitive_keys.include?(auth_key)
        auth_val.downcase!
      end

      {key: auth_key, val: auth_val}
    end

    def render_new_error
      render_error(405, I18n.t('devise_token_auth.sessions.not_supported'))
    end

    def render_create_success
      render json: {
          data: resource_data(resource_json: @resource.token_validation_response)
      }
    end

    def render_create_error_not_confirmed
      render_error(401, I18n.t('devise_token_auth.sessions.not_confirmed', email: @resource.email))
    end

    def render_create_error_account_locked
      render_error(401, I18n.t('devise.mailer.unlock_instructions.account_lock_msg'))
    end

    def render_create_error_bad_credentials
      render_error(401, I18n.t('devise_token_auth.sessions.bad_credentials'))
    end

    def render_destroy_success
      render json: {
          success: true
      }, status: 200
    end

    def render_destroy_error
      render json: {
          success: flase
      }, status: "User not found"
    end

    private

    def resource_params
      params.permit(*params_for_resource(:sign_in))
    end
  end
end