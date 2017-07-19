Rails.application.routes.draw do
  root to: 'dashboards#show'

get '/login', to: 'sessions#new'
get '/logout', to: 'sessions#destroy'
post '/login', to: 'sessions#create'

get '/signup', to: 'users#new'
post '/users', to: 'users#create'

resources :companies

resources :residences

resources :transactions
end
