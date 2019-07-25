Rails.application.routes.draw do

	root to: 'application#home'
	mount_devise_token_auth_for 'User', at: 'auth'
	namespace :api do
		namespace :v1 do
			# API routes
		end
	end

end