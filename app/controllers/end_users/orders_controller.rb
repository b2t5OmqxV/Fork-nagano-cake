class EndUsers::OrdersController < ApplicationController

	def input
		@order = Order.new
		@end_user = EndUser.find(current_end_user.id)
	end

end
