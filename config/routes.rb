Rails.application.routes.draw do
  resources :users
  resources :products
  resources :orders
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
