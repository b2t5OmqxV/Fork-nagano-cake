class ApplicationController < ActionController::Base
	


	# def after_sign_in_path_for(resource)
 #    new_end_user_session_path
 #      case resource
 #      when EndUser
 #        new_end_user_session_path
 #      when admin
 #        admin_root_path
      # end
 #  end

before_action :configure_permitted_parameters, if: :devise_controller?


protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_kana, :first_kana, :zip_code, :address, :phone_number])
  end
end