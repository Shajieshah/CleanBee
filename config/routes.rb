Rails.application.routes.draw do


  resources :notifications
  root to: 'vendors#dashboard'

  # web version for vendor
  devise_for :vendors, controllers: {
      sessions: 'vendors/sessions',
      registrations: 'vendors/registrations',
      passwords: 'vendors/passwords'
  }
  resources :vendors, except: [:destroy] do
    resources :shops
    collection do
      get 'dashboard'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do

      resources :ratings
      resources :users do
        collection do
          get 'get_favourite_shops'
          post 'add_shop_to_favourite'
          delete 'remove_shop_from_favourite'
        end
        member do
          post 'verify_user'
        end
      end
      resources :orders
      resources :laundries, only: [:index]
      resources :shops, only: [:show, :index] do
        collection do
          get 'search_shops'
        end
      end
    end
  end
end

