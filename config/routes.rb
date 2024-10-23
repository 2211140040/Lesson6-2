Rails.application.routes.draw do
  resources :products
  root 'top#main'
  get 'top/main'
  resources :cart_items
  resources :carts
end
