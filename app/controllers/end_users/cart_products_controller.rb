class CartProductsController < ApplicationController

	def index
		@end_user = EndUser.find(current_user.id)
	end
end