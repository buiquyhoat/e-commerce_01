Rails.application.routes.draw do
  get 'imports_file/import'

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

  namespace :admin do
    root "home#index"
    resources :categories, :products, :users, :colors
    resources :statistic, :statistic_pie
  end

  resources :users do
    resources :orders, only: [:new, :create, :show]
  end

  post "/imports_file/import", to: "imports_file#import"

  resources :products do
    resources :comments
  end
  resources :suggest_products, :cart
  namespace :api do
    resources :orders
  end

  get "/:page", to: "static_pages#show"
end
