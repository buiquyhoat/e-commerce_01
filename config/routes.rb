Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  resources :users
  root "products#index"
  get "/:page", to: "static_pages#show"
  resources :products
  resources :suggest_products
end
