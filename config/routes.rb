Rails.application.routes.draw do
  get 'search', to: "search#index"
  get 'orders/success'
  get 'orders/bought'
  get 'orders/sold'
  get 'help', to: "pages#help", as: "help"
  get 'help/guide', to: "pages#guide", as: "guide"
  get 'help/sitemap', to: "pages#sitemap", as: "sitemap"
  resources :listings
  devise_for :accounts
  root 'pages#home'

  post "listings/:id/order", to: "listings#place_order", as: "place_order"

  get "orders/success"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end