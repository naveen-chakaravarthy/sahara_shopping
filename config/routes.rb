Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "sessions#index"

  resources :sessions, :users

  get "/signout" => "sessions#destroy", as: :destroy_session
  get "/shop" => "shop#index", as: :shop_index
  get "/admin/shop" => "shop#admin_shop", as: :admin_shop_index
  post "/add_to_cart/:item_id" => "shop#add_to_cart", as: :shop_add_to_cart
  post "/remove_from_cart/:item_id" => "shop#remove_from_cart", as: :remove_from_cart

  # orders
  get "/my_orders" => "orders#my_orders", as: :my_orders
  get "/my_orders/:order_id" => "orders#my_order_details", as: :my_order_details
  post "/proceed_checkout" => "orders#proceed_checkout", as: :proceed_checkout

  # Admin actions
  get "/admin/orders" => "orders#admin_orders", as: :admin_orders
  get "/admin/set_status/:order_id/:status" => "orders#set_status", as: :set_status
  get "/admin/categories" => "admin#list_categories", as: :list_categories
  get "/admin/items" => "admin#list_items", as: :list_items
  post "/admin/create_category" => "admin#create_category", as: :create_category
  get "/admin/create_category" => "admin#create_category", as: :create_category_get
  post "/admin/create_item" => "admin#create_item", as: :create_item
  get "/admin/create_item" => "admin#create_item", as: :create_item_get
  delete "/admin/delete_item/:item" => "admin#delete_item", as: :delete_item
  delete "/admin/delete_category/:category" => "admin#delete_category", as: :delete_category
end
