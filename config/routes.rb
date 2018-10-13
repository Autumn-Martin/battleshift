Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:show, :index, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"

      end
      resources :users, only: [:index, :show, :update]

    end
  end
end
