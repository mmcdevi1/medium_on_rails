Rails.application.routes.draw do

  resources :users

  resources :posts do 
    resources :recommends
    member do 
      post 'upvote'
      match '/downvote', to: 'posts#downvote', via: :delete
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  get '/register', to: 'users#new'
  get '/login',    to: 'sessions#new'
  match '/logout',   to: 'sessions#destroy', via: :delete

  get '/me/stories/drafts', to: 'stories#index', as: :stories_draft
  get '/me/stories/public', to: 'stories#public', as: :stories_public

  root 'posts#index'
end
