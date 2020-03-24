class Admin::OrdersController < ApplicationController

  def top
	  @orders = Order.where("created_at >=?", Date.today)
  end

	def index
		if request.referer&.include?("/admin/top")
			@orders = Order.where("created_at >=?", Date.today)
		elsif request.referer&.include?("/admin/end_users/.id")
    	@orders = @end_user.orders
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end



private
 def order_params
 	params.require(:order).permit(:end_user_id, :address, :zip_code, :name, :payment_method, :total_fee, :postage, :order_status)
 end

end
