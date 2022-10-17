Rails.application.routes.draw do
  root to: "users#index"

  resources :users
  resources :sessions, :shop

  # orders
  resources :orders do
    resources :order_item
    collection do
      get "admin" => "orders#admin_orders", as: :admin
    end
    member do
      get "/admin/set_status/:status" => "orders#set_status", as: :set_status
    end
  end

  # menu
  resources :menu_category do
    resources :menu_item
    collection do
      get "list_items" => "menu_item#list_items"
    end
  end

  # cart_items
  resources :cart_item do
    collection do
      post "proceed_checkout"
    end
  end
end
