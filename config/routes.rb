Rails.application.routes.draw do
  root "products#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  get "/cart", to: "cart#index"
  get "/cart/clear", to: "cart#destroy"
  post "/cart/:id", to: "cart#create"

  resources :users
  resources :products
  resources :suggest_products
  resources :cart
  get "/:page", to: "static_pages#show"
end
