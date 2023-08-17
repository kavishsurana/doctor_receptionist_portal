class SessionsController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]


    def new
      # Show login form
    end
  
    def create
      user = find_user(params[:email])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully.'
      else
        flash.now[:error] = 'Invalid email or password.'
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to login_path, notice: 'Logged out successfully.'
    end
  
    private
  
    # def find_user(email)
    #   Receptionist.find_by(email: email) || Doctor.find_by(email: email)
    # end

    def find_user(email)
      doctor = Doctor.find_by(name: email)
      return doctor if doctor
    
      Receptionist.find_by(email: email)
    end
    


  end
  