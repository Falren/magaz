Rails.application.routes.draw do
  devise_for :users
  resources :users, except: :delete
  resources :categories, except: :destroy
  resources :products, except: :destroy
  resources :orders, except: :destroy
  resources :line_items, only: %i[create destroy update]
  resources :wish_lists
  resources :wish_list_items, only: %i[create destroy]
  resources :reviews
  root 'home#index'
end
