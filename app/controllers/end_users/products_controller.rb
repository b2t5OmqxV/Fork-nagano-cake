class EndUsers::ProductsController < ApplicationController

	def index
		@genres = Genre.all
		if params[:id]
		@genre = Genre.find(params[:id])
		@products = @genre.products.all
		else
		@products = Product.all
		end
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		@product_new = CartProduct.new
	end

	def create
		@product = CartProduct.new(product_params)
		@product.save
		redirect_to cart_products_path
	end



	private
	def cart_product_params
		params.require(:cart_product).permit(:quantity, :product_id, :end_user_id)
	end

end


