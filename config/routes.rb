Rails.application.routes.draw do
  resources :assignments
  resources :answers
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :assignments, only: [:index] do
        resources :questions
      end
      resources :answers, only: [:create]
    end
  end
  root "home#index"
end
