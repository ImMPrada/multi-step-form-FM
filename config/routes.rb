Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'onboardings#index'

  resources :onboardings, only: %i[index show create] do
    resources :plans, only: %i[index create]
    resources :addons, only: %i[index create]
    resources :summary, only: %i[index]
  end
end
