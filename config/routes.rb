Rails.application.routes.draw do
  devise_for :users
  resources :users, except: :delete
  resources :categories
  resources :products
  resources :orders
  resources :line_items
  resources :wish_lists
  resources :wish_list_items
  root 'home#index'
end
