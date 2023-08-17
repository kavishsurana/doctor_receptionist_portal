class PatientsController < ApplicationController
    before_action :require_login
  
    def index
      @patient = Patient.all
    end
  
    def new
      @patient = Patient.new
    end
  
    def create
      @patient = Patient.new(patient_params)
      if @patient.save
        redirect_to patients_path, notice: 'Patient registered successfully.'
      else
        render :new
      end
    end
  
    def show
      @patient = Patient.find(params[:id])
    end
  
    def graph
      # Implement logic to generate patient registration graph here
      # You can use charting libraries like Chart.js
    end
  
    private
  
    def patient_params
      params.require(:patient).permit(:name, :email, :dob)
    end
  end
  