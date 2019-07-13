Rails.application.routes.draw do
  resources :contributors
  resources :contributions
  resources :candidates
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
