class DoctorsController < ApplicationController
    before_action :require_login
  
    def index
      @doctor = Doctor.all
    end
  
    def new
      @doctor = Doctor.new
    end
  
    def create
      @doctor = Doctor.new(doctor_params)
      if @doctor.save
        redirect_to doctors_path, notice: 'Doctor created successfully.'
      else
        render :new
      end
    end
  
    def show
      @doctor = Doctor.find(params[:id])
    end
  
    private
  
    def doctor_params
      params.require(:doctor).permit(:name, :specialization)
    end
  end
  