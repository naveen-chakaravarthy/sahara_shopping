Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "sessions#index"

  resources :sessions, :users

  get "/signout" => "sessions#destroy", as: :destroy_session
  get "/shop" => "shop#index", as: :shop_index
  post "/add_to_cart/:item_id" => "shop#add_to_cart", as: :shop_add_to_cart
  post "/remove_from_cart/:item_id" => "shop#remove_from_cart", as: :remove_from_cart

  # orders
  get "/my_orders" => "orders#my_orders", as: :my_orders
  get "/my_orders/:order_id" => "orders#my_order_details", as: :my_order_details
  post "/proceed_checkout" => "orders#proceed_checkout", as: :proceed_checkout

  # Admin actions
  get "/admin/orders" => "orders#admin_orders", as: :admin_orders
  get "/admin/set_status/:order_id/:status" => "orders#set_status", as: :set_status
end
