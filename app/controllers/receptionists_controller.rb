class ReceptionistsController < ApplicationController
    before_action :require_login
  
    def index
      @receptionist = Receptionist.all
    end
  
    def new
      @receptionist = Receptionist.new
    end
  
    def create
      @receptionist = Receptionist.new(receptionist_params)
      if @receptionist.save
        redirect_to receptionists_path, notice: 'Receptionist created successfully.'
      else
        render :new
      end
    end
  
    def edit
      @receptionist = Receptionist.find(params[:id])
    end
  
    def update
      @receptionist = Receptionist.find(params[:id])
      if @receptionist.update(receptionist_params)
        redirect_to receptionists_path, notice: 'Receptionist updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @receptionist = Receptionist.find(params[:id])
      @receptionist.destroy
      redirect_to receptionists_path, notice: 'Receptionist deleted successfully.'
    end

    def dashboard
      # Retrieve data for the receptionist dashboard
      @total_patients = Patient.count
      @recent_patients = Patient.order(created_at: :desc).limit(5)
    end

  
    private
  
    def receptionist_params
      params.require(:receptionist).permit(:name, :email, :password, :password_confirmation)
    end
  end
  