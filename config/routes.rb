Rails.application.routes.draw do
  resources :users
  resources :sessions
  root to: 'chat#show'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

end
