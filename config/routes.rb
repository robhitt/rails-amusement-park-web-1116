Rails.application.routes.draw do
  resources :attractions, :users, :sessions
  #post '/users/:id', to: 'users#show'
  get '/signin', to: 'sessions#new', as: 'signin'
  get '/', to: 'users#welcome', as: 'root'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post '/rides', to: 'rides#create', as: 'ride'


end
