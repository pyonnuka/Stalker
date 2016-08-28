Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :artists, :only => [:show, :index]
  resources :checkins, :only => [:create]

  root 'home#index'
  get 'login', to: 'home#login'
end