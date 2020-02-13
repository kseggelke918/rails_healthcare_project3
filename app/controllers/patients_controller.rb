class PatientsController < ApplicationController
    before_action :find_patient, except: [:new, :index]

    def new 
        @patient = Patient.new 
    end 

    def create(patient_params)
        byebug
    end 

    def index 
        @patients = Patient.all 
    end 


    private 
    def find_patient 
        @patient = Patient.find_by(name: params[:name])
    end 
        
    def patient_params 
        params.require(:patient).permit(:name, :symptoms, :doctor_id)
    end 
end
