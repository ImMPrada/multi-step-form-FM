Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "accounts#new"

  resources :accounts, only: [:new, :create]

  resource :account, only: [:show] do
    resources :plans, only: [:new, :create]
    resources :addo_ons, only: [:new, :create]
    resources :payments, only: [:new, :create]
  end
end
