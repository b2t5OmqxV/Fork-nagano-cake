class Admin::OrderProductsController < ApplicationController

	def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end


end
