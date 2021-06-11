class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :logged_in_user, only:[:edit,:update,:destroy]

    private 
    def logged_in_user
        unless logged_in?
            redirect_to login_url
        end
    end

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end
end
