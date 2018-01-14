Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :chatrooms, param: :slug
  resources :all_chatrooms, only: :index

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  root to: 'chatrooms#show', slug: 'general'

end
