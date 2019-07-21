Rails.application.routes.draw do
  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/auth/facebook/callback', to: 'sessions#fb_create'

  resources :contributors
  resources :contributions
  resources :candidates
  resources :users, except: [:new, :create]

  Rails.application.routes.draw do

    resources :contributors, only: [:show, :new, :create] do
      resources :contributions, only: [:show, :index, :new]
    end

    resources :candidates, only: [:show, :new, :create] do
      resources :contributions, only: [:show, :index, :new]
    end

    root 'contributions#index'
  end

  Rails.application.routes.draw do

    resources :candidates, except: [:edit, :new] do
      resource :favorite, only:[:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
