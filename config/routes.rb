Rails.application.routes.draw do
  root to: 'welcome#index'

  # resources :register, only: [:new, :create]
  get '/register', to: "users#new", as: "new_user"
  get '/dashboard', to: "dashboard#index"

  resources :users, only: [:show, :index, :edit, :update, :create]
  get 'users/:id/activation/edit', to: "activation#edit", as: "edit_activation"
  patch 'users/:id/activate', to: "activation#update", as: "activation"

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"

      end
      resources :users, only: [:index, :show, :update]

    end
  end
end
