class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    case resource
      when Admin then
        users_path
      when User then
        new_order_path
    end
  end


  def after_sign_out_path_for(resource)
    case resource
      when :user, User
        new_user_session_path
      when :admin, Admin
        new_admin_session_path
    end
  end


end
