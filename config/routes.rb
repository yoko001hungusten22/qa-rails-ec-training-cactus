Rails.application.routes.draw do
  resources :users
  resources :products
  resources :orders
  resources :carts, only: [:show]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  root 'static_pages#home'
  post '/guest_sign_in', to: 'sessions#guest_sign_in'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/add_item', to: 'carts#add_item'
  delete '/delete_item', to: 'carts#delete_item'
  get 'orders/purchase_completed', to: "orders#purchase_completed"
end
