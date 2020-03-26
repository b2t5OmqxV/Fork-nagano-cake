class Admin::EndUsersController < ApplicationController


before_action :authenticate_admin!
	def index
		# 退会済みになったユーザーも合わせて取得する記述
		
		@end_users = EndUser.with_deleted
	end

	def show
		@end_user = EndUser.find(params[:id])
	end

	def edit
		@end_user = EndUser.find(params[:id])
	end

	def update
		@end_user = EndUser.find(params[:id])
  		if @end_user.update(end_user_params)
  			# @end_user.restore
  		redirect_to admin_end_user_path(@end_user), notice: "successfully updated user!"
  		else
  		render "edit"
  		end
	end

	private
	def end_user_params
    params.require(:end_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :is_unsubscribed)
	end


end
