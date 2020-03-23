class EndUsers::OrdersController < ApplicationController

	def input
		@order = Order.new
		@end_user = EndUser.find(current_end_user.id)
		@shipping_address = ShippingAddress.new
	end

	def create
		@order = Order.new(order_params)
		@shipping_address =ShippingAddress.new(shipping_address_params)
		if @shipping_address.save
			redirect_to order_check_path
		else
			redirect_to order_check_path
		end
	end

	def order_check

	end



	private
	def order_params
		params.require(:order).permit(:payment_method, :end_user_id)
	end

	def shipping_address_params
		params.require(:order).permit(:zip_code, :address, :name, :end_user_id)
	end

end
