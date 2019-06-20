Rails.application.routes.draw do
  # resources :games, only: [:index, :new, :create, :show]
  # resources :questions, only: [:new, :create, :edit, :update]
  # resources :sessions, param: :username, only: [:index, :show, :new, :create, :destroy]
  # resources :users, only: [:new, :create, :show]
  # get '/games/:id/' , to: 'games#show'
  # get '/games/:username/lobby', to: 'games#lobby', as: 'lobby'

  resources :sessions, only: [:new, :create]
  resources :users, param: :username, only: [:new, :create, :show]
  get "/login", to: "sessions#new", as: :login
  delete "/byebye", to: "sessions#destroy", as: :logout

end
