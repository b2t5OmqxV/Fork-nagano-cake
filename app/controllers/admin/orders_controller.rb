class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def top
	  @orders = Order.where("created_at >=?", Date.today)
  end

	def index
		if request.referer&.include?("/admin/top")
			@orders = Order.where("created_at >=?", Date.today)
		elsif params[:end_user_id]
      @orders = Order.where("end_user_id >=?" ,params[:end_user_id])
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
    if @order.order_status == "payment_confirmation"
      @order.order_products.each do |order|
      order.production_status = :waiting_production
      order.update(order_products_params)
      end
      redirect_to admin_order_path(@order.id)
    else
      redirect_to admin_order_path(@order.id)
    end
  end



private
 def order_params
 	params.require(:order).permit(:end_user_id, :address, :zip_code, :name, :payment_method, :total_fee, :postage, :order_status)
 end


  def order_products_params
    params.permit(:product_id, :quantity, :price, :production_status)
  end

end
