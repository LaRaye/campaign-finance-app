Rails.application.routes.draw do
  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  get '/signup', to: 'users#new'

  resources :contributors
  resources :contributions
  resources :candidates
  resources :users, except: :new

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
