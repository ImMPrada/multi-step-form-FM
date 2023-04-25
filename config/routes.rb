Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "accounts#new"

  resources :accounts, only: [:new, :create]

  resources :accounts do
    get 'select_plan', on: :member, to: 'accounts#select_plan'
    post 'add_plan', on: :member, to: 'accounts#add_plan'
    post 'select_add_ons'
    post 'summary'
  end
end
