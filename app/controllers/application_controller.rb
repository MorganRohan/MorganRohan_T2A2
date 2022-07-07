class ApplicationController < ActionController::Base
    # Devise gem primarily operates through the below before_action
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_query

    
    def set_query
        @query = Listing.ransack(params[:q])
    end

    protected

    # Method for setting devise santizisation 
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
