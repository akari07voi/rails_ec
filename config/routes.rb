# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :items
    # get 'items/index'
    # get 'items/new'
    # get 'items/edit'
    delete 'items/:id', to: 'items#destroy'
  end
  root to: 'items#index'

  resources :items

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
