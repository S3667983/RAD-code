Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get 'users/new'
  get 'session/new'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users

end