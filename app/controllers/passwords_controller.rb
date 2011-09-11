class PasswordsController < Devise::PasswordsController

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    #if successful_and_sane?(resource)
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    #else
    #  respond_with_navigational(resource){ render_with_scope :new }
   # end
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      set_flash_message(:notice, :updated) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => redirect_location(resource_name, resource)

      Emailer.forgotten_psw_confirmation(current_user).deliver
    else
      respond_with_navigational(resource) { render_with_scope :edit }
    end

  end

end