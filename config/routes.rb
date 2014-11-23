Rails.application.routes.draw do
  resources :users
  resources :posts

  get '/register', to: 'users#new'
  

  root 'posts#index'
end
