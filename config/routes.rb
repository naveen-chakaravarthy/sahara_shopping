Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "sessions#index"

  resources :sessions, :users, :shop

  delete "/signout" => "sessions#destroy", as: :destroy_session
end
