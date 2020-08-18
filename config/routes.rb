Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :products
  resources :users, only: %i[edit show update]
  resources :categories
  resources :line_items
  root 'home#index'
end
