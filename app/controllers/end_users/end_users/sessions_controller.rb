# frozen_string_literal: true

class EndUsers::EndUsers::SessionsController < Devise::SessionsController





  def after_sign_in_path_for(resource)
        root_path
  end


  def after_sign_out_path_for(resource)
    new_end_user_session_path # ログアウト後に遷移するpathを設定
  end






  #    def reject_user
  #   @end_user = EndUser.find_by(email: params[:end_user][:email].downcase)

  #   if @user
  #     if (@user.valid_password?(params[:end_user][:password]) && (@user.active_for_authentication? == false))
  #       flash[:error] = "退会済みです。"
  #       redirect_to new_user_session_path
  #     end
  #   else
  #     flash[:error] = "必須項目を入力してください。"
  #   end
  # end







  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
