Rails.application.routes.draw do

	root to: 'application#home'
	
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

	mount_devise_token_auth_for 'User', at: 'auth'

	namespace :api do
		namespace :v1 do
			
			# Vendor's Shop
			resources :shop, except: [:new, :edit]

			resources :users do
				member do
					post 'verify_user'
			  end
			end
		end
	end

end