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
    get :continue, on: :member
    get :select_plan, on: :member
    get :select_addons, on: :member
  end

  resources :accounts, only: %i[show] do
    patch :add_plan, on: :member
  end
end
