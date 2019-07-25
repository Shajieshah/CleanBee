Rails.application.routes.draw do
	mount_devise_token_auth_for 'User', at: 'auth'
	namespace :api do
		namespace :v1 do
			get '/test', to: 'users#test'
		end
	end
end