class Admin::OrdersController < ApplicationController

  def top
	  @orders = Order.all
  end

	def index
		@order = Order.find(params[:id])
  end

private
 def order_params
 	params.require(:order).permit(:end_user_id, :address, :zip_code, :name, :payment_method, :total_fee, :postage, :order_status)
 end

end
