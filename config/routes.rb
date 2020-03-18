Rails.application.routes.draw do

	root "products#top"

	resource :end_users, only: [:edit, :update]
	get "my_page" => "end_users#my_page"
	get "check" => "end_users#check"
	post "unsubscribed" => "end_users#unsubscribed"

	resources :products, only: [:index, :show]

	resources :cart_products, only: [:index, :create, :destroy]
	delete "cart_products" => "cart_products#clear"

	resources :orders, only: [:index, :show, :create]
	get "input" => "orders#input"
	get "check" => "orders#check"
	get "thanks" => "orders#thanks"

	resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]

 	devise_for :admins, skip: :all
 	devise_scope :admins do
    get "admins/sign_in" => "admins/sessions#new", as: "new_admin_session"
    post "admins/sign_in" => "admins/sessions#create", as: "admin_session"
    delete "admins/sign_out" => "admins/sessions#destroy", as: "destroy_admin_session"
  end

	namespace :admin do
		get "top" => "orders#top"
		resources :end_users, only: [:index, :show, :edit, :update]
		resources :products, only: [:index, :new, :show, :create, :edit, :update]
		resources :genres, only: [:index, :create, :edit, :update]
		resources :orders, only: [:index, :show,]
		post "update" => "orders#update"
		post "update" => "order_products#update"
	end

end
