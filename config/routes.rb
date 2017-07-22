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
  resources :calves, only: :index

  resources :calving_cows, only: :show do
    resources :calves, only: :show
  end

  namespace :admin do
    resources :companies
    resources :residences
    resources :ranch_transactions
    resources :feeder_cows, except: [:show, :index]
    resources :calving_cows, except: [:show, :index] do
      resources :calves, except: [:show, :index]
    end
  end
end
