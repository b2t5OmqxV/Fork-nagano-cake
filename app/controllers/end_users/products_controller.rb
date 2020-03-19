class EndUsers::ProductsController < ApplicationController

	def index
		@genres = Genre.all
		if @genre = Genre.find(params[:id])
		@products = Genre.product.all
		else
		@products = Product.all
		end
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
	end
end


