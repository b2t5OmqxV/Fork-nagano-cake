class EndUsers::CartProductsController < ApplicationController

	def index
		@end_user = EndUser.find(current_end_user.id)
	end

	def create
		@product = CartProduct.new(cart_product_params)
		@product.save!
		redirect_to cart_products_path
	end

	def destroy
		cart_product = CartProduct.find(params[:id])
		cart_product.destroy
		redirect_to request.referer
	end

	private
	def cart_product_params
		params.require(:cart_product).permit(:quantity, :product_id, :end_user_id)
	end
end