class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        puts "****************************************1"
          if resource.isinvestor
            respond_with resource, location: verifyInvestor_path(resource)
          else
            respond_with resource, location: after_sign_up_path_for(resource)
          end
        puts "****************************************1"
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        puts "****************************************1"
          puts resource
        puts "****************************************1"
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
