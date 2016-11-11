Rails.application.routes.draw do
  root "products#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  get "/cart", to: "cart#index"
  delete "/cart/:id/delete", to: "cart#destroy"
  post "/cart/:id", to: "cart#create"
  patch "/cart/:id", to: "cart#update"
  get "/cart/:id/edit", to: "cart#edit"

  resources :users do
    resource :orders, only: [:new, :create, :show]
  end
  resources :products
  resources :suggest_products
  resources :cart
  get "/:page", to: "static_pages#show"
end
