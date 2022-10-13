class ApplicationController < ActionController::Base
    before_action :set_locale

    private

    def default_url_option
        {locale: I18n.locale}
    end

    def set_locale
        I18n.locale = extract_locale || I18n.default_locale
    end

    def extract_locale
        parsed_locale = params[:locale]
        I18n.available_locales.map(&:to_s).inclide?(oarsed_locale)
        parsed_locale.to_sym :
        nil 
    end
end
