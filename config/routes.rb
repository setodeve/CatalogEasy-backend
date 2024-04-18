# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :catalogs
    resources :products
    resources :templates
    resources :catalog_sections
    resources :product_images
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }
    namespace :auth do
      resources :sessions, only: [:index]
    end
  end
end
