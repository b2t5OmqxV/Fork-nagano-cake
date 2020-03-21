class EndUsersController < ApplicationControlle

	def my_pages 
		@end_user = EndUser.find(params[:id])
	end

	def edit 
		@end_user = EndUser.find(params[:id])
	end

	private 
	def end_user_params
    params.require(:end_user).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:zip_code,:address,:phone_number,:is_unsubscribed)
  end
end
