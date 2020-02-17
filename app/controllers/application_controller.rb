class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_user
    # with devise can check to make sure user is logged in 
    # put helper methods here like logged_in?, etc

    def welcome 
        @user = current_user 
    end 

    protected 

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :specialty])
    end 
end
