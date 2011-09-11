class RegistrationsController < Devise::RegistrationsController

  #before_filter :authenticate_admin!

  # GET /resource/sign_up
  #def new

   # @apd_supplies = ApdSupply.all

    #resource = build_resource({})
    #respond_with_navigational(resource){ render_with_scope :new }


  #end


  protected
  def after_sign_up_path_for(resource)
    "/orders/new"
  end

  def after_inactive_sign_up_path_for(resource)
    users_path
  end
end