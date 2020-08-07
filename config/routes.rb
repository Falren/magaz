Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :products
  root 'home#index'
end
