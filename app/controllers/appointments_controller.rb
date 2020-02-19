class AppointmentsController < ApplicationController

    def new 
        @user_id = params[:user_id]
        @appointment = Appointment.new 
    end 

    def create 
        @appointment = Appointment.new(appointment_params)
  
        if @appointment.save 
            redirect_to patients_url
        else 
            render :new 
        end 
    end 

    def display_next_appointment
        @next_appointment = current_user.appointments.next_appointment 
    end 

    def destroy 
    end 

    private 

    def appointment_params
        params.require(:appointment).permit(:time, :user_id, :patient_id)
    end 
    
end
