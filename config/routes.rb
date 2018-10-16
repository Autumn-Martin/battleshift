Rails.application.routes.draw do
  root to: 'welcome#index'

  # resources :register, only: [:new, :create]
  get '/register', to: "users#new", as: "new_user"
  get '/dashboard', to: "dashboard#index"

  resources :users, only: [:show, :index, :edit, :update, :create]
  get 'users/:id/activate', to: "users#activate", as: "activate"
  # patch 'users/:id/activate', to: "users#activate", as: "activation"


  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :create] do
        post "/shots", to: "games/shots#create"
        resources :ships, only: [:index, :create]
      end
      # api_v1_game_ships GET   /api/v1/games/:game_id/ships(.:format)     api/v1/ships#index
      #
      # Started POST "/api/v1/games/3/ships" for 127.0.0.1 at 2018-10-16 14:53:19 -0600


      resources :users, only: [:index, :show, :update]

    end
  end
end
