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
		@end_user = EndUser.find(current_end_user.id)
	end
end


