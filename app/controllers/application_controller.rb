class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # #before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_admin!, if: :admin_url
  # # before_action :authenticate_customer!, if: :public_url

  # #def after_sign_in_path_for(resource)
  #   #admin_items_path
  # #end

  # def admin_url
  #   request.fullpath.include?("/admin")
  # end

  # # def public_url
  # #   request.path.include?("/public")
  # # end

  # # # customers


  # # def after_sign_in_path_for(resource_or_scope)
  # #   if resource.is_a?(Admin)
  # #     admin_root_path
  # #   # else
  # #   #   about_path
  # #   end
  # # end

  # # def after_sign_out_path_for(resource_or_scope)
  # #   if resource_or_scope == :admin
  # #     new_admin_session_path
  # #   # else
  # #   #   about_path
  # #   end
  # # end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end

end
