Rails.application.routes.draw do
  resources :users
  resources :products
  get '/login', to: 'sessions#new'
end
