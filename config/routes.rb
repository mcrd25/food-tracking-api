Rails.application.routes.draw do
  resources :users, only: [:show, :create]
  resources :meal_types
  resources :meal_entries
end
