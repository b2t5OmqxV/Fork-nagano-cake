Rails.application.routes.draw do


    devise_for :end_users, controllers: {
      sessions: "end_users/end_users/sessions",
      registrations: "end_users/end_users/registrations",
      passwords: "end_users/end_users/passwords"
    }

  	scope module: :end_users do
		root "products#top"

		resources :end_users, only: [:update]
		get "my_page" => "end_users#my_page"
		get "my_page_edit" => "end_users#my_page_edit"
		get "check" => "end_users#check"
		post "unsubscribed" => "end_users#unsubscribed"

		resources :products, only: [:index, :show]

		resources :cart_products, only: [:index, :create, :destroy, :update]
		delete "cart_products" => "cart_products#clear"

		resources :orders, only: [:index, :show, :create]
		get "input" => "orders#input"
		get "order_check" => "orders#order_check"
		get "thanks" => "orders#thanks"

		resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
	end

 	devise_for :admins, skip: :all
 	devise_scope :admin do
    get "admin/sign_in" => "admins/sessions#new", as: "new_admin_session"
    post "admin/sign_in" => "admins/sessions#create", as: "admin_session"
    delete "admin/sign_out" => "admins/sessions#destroy", as: "destroy_admin_session"
  end

	namespace :admin do
		get "top" => "orders#top"
		resources :end_users, only: [:index, :show, :edit, :update]
		resources :products, only: [:index, :new, :show, :create, :edit, :update]
		resources :genres, only: [:index, :create, :edit, :update]
		resources :orders, only: [:index, :show,]
		post "update" => "orders#update"
		post "production_update" => "order_products#update"
	end

end
