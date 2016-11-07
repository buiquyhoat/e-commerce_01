Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  resources :users
  root "static_pages#home"
  get "/:page", to: "static_pages#show"
end
