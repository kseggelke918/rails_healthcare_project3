class AppointmentsController < ApplicationController

    def new 

    end 

    def create 
        @patient = Patient.find_by(id: params[:patient][:appointments])
  
        @appointment = @patient.appointments.build(appointment_params)
        byebug
        if @appointment.save 
            redirect_to [@user, @patient]
        else 
            render :new 
        end 
    end 

    def display_next_appointment
        @test = next_appointment 
    end 

    def destroy 
    end 

    private 

    def appointment_params
        params.require(:appointment).permit(:time, :user_id, patient_attributes:[:patient_id, :name, :symptoms])
    end 
    
end
