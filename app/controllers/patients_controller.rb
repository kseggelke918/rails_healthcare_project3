class PatientsController < ApplicationController
    before_action :find_patient, except: [:new, :index]
    before_action :find_user, only: [:new, :edit]

    def new 
        @patient = Patient.new 
    end 

    def create
        @user = User.find_by(id: params[:user_id])
        @patient = @user.patients.build(patient_params)

        if @patient.save 
            redirect_to [@user, @patient]
        else 
            render :new 
        end 
    end 

    def show 

    end 

    def index 
        @patients = Patient.all 
    end 


    private 
    def find_patient 
        @patient = Patient.find_by(id: params[:id])
    end 

    def find_user 
        @user = User.find_by(id: params[:user_id])
    end 
        
    def patient_params 
        params.require(:patient).permit(:name, :symptoms, user_attributes:[:user_id, :name])
    end 
end
