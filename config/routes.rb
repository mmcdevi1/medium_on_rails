Rails.application.routes.draw do

  resources :users
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]

  get '/register', to: 'users#new'
  get '/login',    to: 'sessions#new'
  match '/logout',   to: 'sessions#destroy', via: :delete

  root 'posts#index'
end
