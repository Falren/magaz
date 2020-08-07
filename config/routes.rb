Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :products
  resources :users
  root 'home#index'
end
