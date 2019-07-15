Rails.application.routes.draw do
  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :contributors
  resources :contributions
  resources :candidates
  resources :users, except: :new

  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
