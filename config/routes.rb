Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "sessions#index"

  resources :sessions, :users

  get "/signout" => "sessions#destroy", as: :destroy_session
  get "/shop" => "shop#index", as: :shop_index
  post "/add_to_cart/:item_id" => "shop#add_to_cart", as: :shop_add_to_cart
  post "/remove_from_cart/:item_id" => "shop#remove_from_cart", as: :remove_from_cart
end
