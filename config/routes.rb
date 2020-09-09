Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :meal_types
  resources :meal_entries
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
