Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :toilets, only: [:index, :show, :create] do
        resources :reviews, only: [:new, :create]
      end
      resources :users, only: [:show] do
        resources :favorites, only: [:index, :create]
      end
      devise_scope :user do
        post 'login', to: 'user_sessions#create', as: 'login'
        post 'manual_login', to: 'user_sessions#manual_login', as: 'manual_login'
      end
    end
  end
end
