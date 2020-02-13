class PatientsController < ApplicationController

    def new 
    end 

    def index 
        @patients = Patient.all 
    end 


    private 

    def patient_params 
        params.require(:patient).permit(:name, :symptoms, :doctor_id)
    end 
end
