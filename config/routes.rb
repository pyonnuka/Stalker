Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'artist/:id/ranking', to: 'artists#ranking'
  get 'artist/:id/map', to: 'artists#map'

  root 'home#index'
end