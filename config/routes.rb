# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :catalogs
    resources :products
    resources :templates
    resources :catalog_sections
    resources :product_images
  end
end
