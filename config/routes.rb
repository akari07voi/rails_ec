# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :items
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  root to: 'items#index'

  resources :items

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
