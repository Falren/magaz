Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :products
  resources :users
  resources :categories
  root 'home#index'
end
