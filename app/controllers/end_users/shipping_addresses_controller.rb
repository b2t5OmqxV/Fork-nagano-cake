class EndUsers::ShippingAddressesController < ApplicationController
 
before_action :authenticate_end_user!

 def index
 	@shipping_address = ShippingAddress.new

 	# currentユーザーが登録した追加配送先のデータの抽出
 	# @shipping_addresses = ShippingAddress.where(end_user_id: current_end_user.id)
 	@end_user = EndUser.find(current_end_user.id)
 end
 
 def create
 	@shipping_address = ShippingAddress.new(address_params)
    @shipping_address.end_user_id =current_end_user.id
 	@shipping_address.save
 	redirect_to request.referer
 end


 def edit
 	@shipping_address = ShippingAddress.find(params[:id])
 end

def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(address_params)
    redirect_to shipping_addresses_path
end

	def destroy
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_address.destroy
		redirect_to request.referer
	end

private

  def address_params
	  params.require(:shipping_address).permit(:zip_code, :address, :name)
  end
end