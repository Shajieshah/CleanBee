Rails.application.routes.draw do

	root to: 'application#home'
	
	# web version for vendor
	resources :vendor do
		resources :shop
	end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

	mount_devise_token_auth_for 'User', at: 'auth'

	namespace :api do
		namespace :v1 do
			resources :users do
				member do
					post 'verify_user'
					get 'user_profile'
			  end
			end
		end
	end

end