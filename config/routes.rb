Rails.application.routes.draw do

  root to: 'vendors#dashboard'

  # web version for vendor
  devise_for :vendors, controllers: {
      sessions: 'vendors/sessions',
      registrations: 'vendors/registrations',
      passwords: 'vendors/passwords',
      confirmations: 'vendors/confirmations'
  }

  resources :vendors, except: [:destroy] do
    resources :shops, except: [:new, :destroy]
  end
  resources :orders, only: [:index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do

      resources :ratings
      resources :users do
        collection do
          get 'favourite_shops'
          post 'add_shop_to_favourite'
          delete 'remove_shop_from_favourite'
        end
        member do
          post 'verify_user'
        end
      end
      resources :orders
      resources :notifications
      resources :laundries, only: [:index]
      resources :shops, only: [:show, :index] do
        collection do
          get 'search_shops'
        end
      end
      resources :reported_orders
    end
  end
end

