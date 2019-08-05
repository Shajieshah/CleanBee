Rails.application.routes.draw do


  root to: 'vendors#dashboard'

  # web version for vendor
  devise_for :vendors, controllers: {
      sessions: 'vendors/sessions',
      registrations: 'vendors/registrations',
      passwords: 'vendors/passwords'
  }
  resources :vendors do
    collection do
      get 'dashboard'
    end
    resources :shops
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :users do
        member do
          post 'verify_user'
        end
      end
      resources :orders
      resources :shops, only: [:show, :index] do
        collection do
          get 'search_shops'
        end
      end
    end
  end
end

