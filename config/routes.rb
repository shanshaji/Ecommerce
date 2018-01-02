Rails.application.routes.draw do
  resources :coupons
  resources :brands
  resources :addresses
  resources :orders
  resources :wishlists
  devise_for :users
  get 'products/index'
  	resources :reviews
	resources :categories
	resources :cart_line_items
	resources :products # routes for index, new
	get 'say/hello'
	root 'products#index'
	get 'say/goodbye'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
