class EndUsers::OrdersController < ApplicationController

	before_action :authenticate_end_user!

	def index
		@end_user = EndUser.find(current_end_user.id)
	end

	def show
		@order = Order.find(params[:id])
	end

	def input
		@order = Order.new
		@end_user = EndUser.find(current_end_user.id)
		@shipping_address = ShippingAddress.new
	end

	def create
		@end_user = EndUser.find(current_end_user.id)
		@order = Order.new(order_params)
		if params[:select] == "3"
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.save
		else
		@order.save
		@end_user.cart_products.each do |f|
			@order_products = OrderProduct.new(order_products_params)
			@order_products.order_id = @order.id
			@order_products.product_id = f.product.id
			@order_products.quantity = f.quantity
			@order_products.price = f.product.price
			@order_products.production_status = :cannot_start
			@order_products.save
		end
		end
		@end_user.cart_products.each do |c|
			c.destroy
		end
		redirect_to thanks_path
	end

	def order_check
		if params[:order][:address_select] == "3" && params[:shipping_address][:zip_code].empty? && params[:shipping_address][:address].empty? && params[:shipping_address][:name].empty?
			redirect_to input_path, notice: "配送先を入力して下さい"
		else
			@end_user = EndUser.find(current_end_user.id)
		end
	end



	private
	def order_params
		params.permit(:payment_method, :end_user_id, :address, :zip_code, :name, :total_fee, :postage, :order_status)
	end

	def shipping_address_params
		params.permit(:zip_code, :address, :name, :end_user_id)
	end

	def order_products_params
		params.permit(:product_id, :quantity, :price, :production_status)
	end

end
