Rails.application.routes.draw do
  resources :games, only: [:index, :new, :create, :show]
  resources :questions, only: [:new, :create, :edit, :update]
  resources :sessions, param: :username, only: [:index, :show, :new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  get '/games/:game_id/:category_id/:user_id' , to: 'game#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
