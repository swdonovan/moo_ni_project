Rails.application.routes.draw do
  root to: 'dashboards#show'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  resources :users, only: :show
  resources :feeder_cows, only: :index
  resources :calving_cows, only: :index

  namespace :admin do
    resources :companies
    resources :residences
    resources :transactions
    resources :feeder_cows, except: [:show, :index]
    resources :calving_cows, except: [:show, :index]
  end
end
