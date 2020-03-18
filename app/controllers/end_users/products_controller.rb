class ProductsController < ApplicationController

	def index
		@genre = Genre.find(params[:id])
		@products = Product.all
	end
end

