Rails.application.routes.draw do
  resources :games, only: [:new, :create]
  resources :questions, only: [:new, :create, :edit, :update]
  resources :sessions, param: :username, only: [:index, :show, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
