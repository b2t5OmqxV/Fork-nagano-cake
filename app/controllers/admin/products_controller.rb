class Admin::ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if product.save
			redirect_to admin_products_path
		else
			render :new
		end
	end
end

