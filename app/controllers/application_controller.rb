class ApplicationController < ActionController::Base
    before_action :set_locale

    include ApplicationHelper









    private



    def set_locale
        I18n.locale = params[:locale] || session[:locales]  
        session[:locales] = I18n.locale
    end
    
    def default_url_options(option={})
        {locale: I18n.locale}
    end


end
