Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :toilets, only: [:index, :show, :create]
      resources :users, only: [:show, :create]
    end
  end
end
