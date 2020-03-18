class ProductsController < ApplicationController

	def index
		@genre = Genre.find(params[:id])
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end
end

