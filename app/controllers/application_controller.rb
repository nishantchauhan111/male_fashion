class ApplicationController < ActionController::Base
    before_action :set_locale

    include ApplicationHelper
    def after_sign_in_path_for(resource)
      UserMailer.welcome_email(current_user).deliver_now
        root_path
      end
      
      before_action :authenticate_user!
      before_action :configure_permitted_parameters, if: :devise_controller?
      before_action :set_locale
    
      protected
    
      def set_locale(&action)
        I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
        session[:locale] = I18n.locale
      end
    
      def default_url_options(options={})
        { locale: I18n.locale }
      end
    
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
      end

end
