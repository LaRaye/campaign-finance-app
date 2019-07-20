Rails.application.routes.draw do
  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :contributors
  resources :contributions
  resources :candidates
  resources :users, except: [:new, :create]

  Rails.application.routes.draw do

    resources :contributors, only: [:show] do
      resources :contributions, only: [:show, :index]
    end

    resources :contributions

    root 'contributions#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
