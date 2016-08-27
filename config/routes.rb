Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'artist/:id', to: 'artists#show'

  root 'home#index'
  get 'login', to: 'home#login'
end