class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_user_startups

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:isinvestor, :username])
    devise_parameter_sanitizer.permit(:account_update ,keys: [:email, :password, :username, :current_password])
  end
  def current_user_startups
  	@current_user_startups= Startup.find(current_user.founderships.pluck(:id))
  end
end
