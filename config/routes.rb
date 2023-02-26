# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :members
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'customers#index'
end
