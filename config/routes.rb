Rails.application.routes.draw do

  # resources :users, only: [:show]
  get '/users/:id', to: 'users#show'
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"

      end
      resources :users, only: [:index, :show]

    end
  end
end
