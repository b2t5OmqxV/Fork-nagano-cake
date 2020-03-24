class EndUsers::EndUsersController < ApplicationController


	def my_page
		# @end_user = EndUser.find(params[:id])
	end

	def my_page_edit
		# @end_user = EndUser.find(par ams[:id])
	end

	def update
       @end_user = EndUser.find(current_end_user.id)
    if @end_user.update(end_user_params)
       flash[:notice] = "you are successfully"
       redirect_to my_page_path
    else
       render :my_page_edit
    end
  end

# 退会確認画面アクション
	def check
	end

# 退会ステータス変更アクション
	def unsubscribed
    @end_user = EndUser.find(current_end_user.id)
    # 退会ステータスを有効にする
    @end_user.update(is_unsubscribed: true )
    @end_user.destroy
    # ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
end



	private
	def end_user_params
    params.require(:end_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :is_unsubscribed)
  end
end
