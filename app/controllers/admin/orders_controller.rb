class Admin::OrdersController < ApplicationController

	def index
		@oreder = Oreder.find(params[:id])
  end

private
 def oreder_params
# This file is auto-generated from the current state of the database. Instead
 	params.require(:oreder).permit(:end_user_id, :address, :zip_code, :name, :payment_method, :total_fee, :postage, :order_status)
 end

end
