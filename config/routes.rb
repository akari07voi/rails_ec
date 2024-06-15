# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :items
  end
  root to: 'items#index'

  get '/carts', to: 'carts#index'
  post '/carts', to: 'carts#create'
  delete '/carts', to: 'carts#destroy'
  resources :items

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
