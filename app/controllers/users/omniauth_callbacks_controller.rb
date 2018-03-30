class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def google_oauth2
  #   @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
  #   puts('----------------------------------')
  #   puts(@user)
  #   puts('----------------------------------')

  #   if @user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #   puts('----------------------------------')
  #   puts(@user.errors.full_messages)
  #   puts('----------------------------------')
  #     session["devise.google_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  # def facebook
  #   @user = User.from_omniauth(request.env["omniauth.auth"])

  #   if @user.persisted?
  #     sign_in_and_redirect @user, :event => :authentication
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)

        if @user.persisted?
          handle_redirect("devise.#{provider}_uid", "#{provider}".capitalize)
        else
          puts('----------------------------------')
          puts(@user.errors.full_messages)
          puts('----------------------------------')
          session["devise.#{provider}_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url,flash[:notice] =>" @user.errors.full_messages"
        end
      end
    }
  end

  [:facebook, :google_oauth2].each do |provider|
    provides_callback_for provider
  end

  def handle_redirect(_session_variable, kind)
    # here we force the locale to the session locale so it switches to the correct locale
    I18n.locale = session[:omniauth_login_locale] || I18n.default_locale
    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
  end



  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
