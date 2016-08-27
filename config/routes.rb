Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :artists, :only => [:show]

  root 'home#index'
  get 'login', to: 'home#login'
end