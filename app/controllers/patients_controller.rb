class PatientsController < ApplicationController



    private 

    def patient_params 
        params.require(:patient), permit(:name, :symptoms, :doctor_id)
    end 
end
