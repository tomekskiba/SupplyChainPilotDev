class RegistrationsController < Devise::RegistrationsController

  protected
  def after_sign_up_path_for(resource)
    "/orders/new"
  end

  def after_inactive_sign_up_path_for(resource)
    users_path
  end

end