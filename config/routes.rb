Rails.application.routes.draw do
  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get 'contributions/:id/edit', to: 'contributions#edit', as: :edit_contribution
  patch 'contributions/:id', to: 'contributions#update'

  get 'candidates/:id/edit', to: 'candidates#edit', as: :edit_candidate
  patch 'candidates/:id', to: 'candidates#update'

  get 'contributors/:id/edit', to: 'contributors#edit', as: :edit_contributor
  patch 'contributors/:id', to: 'contributors#update'

  resources :contributors, except: [:edit, :update]
  resources :contributions, except: [:edit, :update]
  resources :candidates, except: [:edit, :update]
  resources :users, except: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
