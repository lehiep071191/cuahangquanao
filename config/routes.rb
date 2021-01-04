Rails.application.routes.draw do
  get 'categories/index'
  get 'orders/new'
  get 'orders/show'
  get 'product/index'
  get 'product/show'
  get '/home', to: 'pages#index'
  root "pages#index"		
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  resources :categories, only: [:index,:show]
  resources :carts
  resources :cart_products
  resources :products, only: [:index,:show]
  resources :orders
  resources :order_items
  resources :comments
  resources :add_to_carts, only: [:create, :update]
  resources :rates
  namespace :admin do 
  	resources :products
  	resources :categories
    resources :orders
  end	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
