class EndUsers::ProductsController < ApplicationController


	def top
	   @genres = Genre.all
	   @products = Product.all
    end






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
		if end_user_signed_in?
		@end_user = EndUser.find(current_end_user.id)
	else
	end
	end
end


