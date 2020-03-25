class Admin::OrderProductsController < ApplicationController

	def update
    @order_product = OrderProduct.find(params[:order_product][:order_id])
    @order_product.update(order_products_params)
    order = @order_product.order
    order.order_products .each_with_index do |c,index|
    unless c.production_status == "completed_production"
    	break
    	end
    	if index == order.order_products.size - 1
    	puts @check = 1
  		end
    end
    	if @order_product.production_status == "in_production"
    	order.order_status = :in_production
    	order.update(order_params)
    	redirect_back(fallback_location: request.referrer)
    	elsif @check == 1
    	order.order_status = :preparing_shipment
    	order.update(order_params)
    	redirect_back(fallback_location: request.referrer)
    	else
    	redirect_back(fallback_location: request.referrer)
    	end
  	end

  private
  	def order_products_params
		params.require(:order_product).permit(:product_id, :quantity, :price, :production_status)
	end

	def order_params
 	params.permit(:end_user_id, :address, :zip_code, :name, :payment_method, :total_fee, :postage, :order_status)
 end
end
