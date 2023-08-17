class ApplicationController < ActionController::Base
    before_action :require_login
  
    private
  
    def require_login
      unless logged_in?
        flash[:error] = 'You must be logged in to access this section'
        redirect_to login_path # You should adjust this based on your routes
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def current_user
      @current_user ||= Receptionist.find_by(id: session[:user_id]) || Doctor.find_by(id: session[:user_id])
    end
  end
  