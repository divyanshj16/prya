class RegistrationsController < Devise::RegistrationsController


  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
          if resource.isinvestor
            respond_with resource, location: verifyInvestor_path(resource)
          else
            respond_with resource, location: after_sign_up_path_for(resource)
          end
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
          puts resource
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def update
    new_params = params.require(:user).permit(:email, :password, :username, :current_password, :avatar, :covph, :accred, :experience, :details, :ident)
    change_password = true
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      new_params = params.require(:user).permit(:accred, :experience, :details, :ident)
      change_password = false
    end

    @user = User.find(current_user.id)
    is_valid = false

    if change_password
      is_valid = @user.update_with_password(new_params)
    else
      is_valid = @user.update_without_password(new_params)
    end

    if is_valid
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

end
