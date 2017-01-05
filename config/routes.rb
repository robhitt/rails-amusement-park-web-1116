Rails.application.routes.draw do
  resources :attractions, :users, :sessions
  get '/', to: 'users#welcome', as: 'root'
  
end
