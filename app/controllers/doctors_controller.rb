class DoctorsController < ApplicationController


    private 

    def doctor_params 
        params.require(:doctor), permit(:name, :specialty, :patient_id)
    end 
   
end
