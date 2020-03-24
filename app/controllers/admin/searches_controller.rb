class Admin::SearchesController < ApplicationController

 def search
  @product_or_end_user = params[:option]
    if @product_or_end_user == "1"
      @products = Product.search(params[:search],@product_or_end_user)
    else
      @end_users = EndUser.search(params[:search],@product_or_end_user)
    end
    render action: :search
  end

end
