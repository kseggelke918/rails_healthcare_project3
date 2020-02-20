class PatientsController < ApplicationController
    before_action :find_patient, except: [:new, :index]
    before_action :find_user, only: [:new, :edit, :create, :update]

    def new 
        @patient = Patient.new 
    end 

    def create
        @patient = @user.patients.build(patient_params)

        if @patient.save 
            redirect_to [@user, @patient]
        else 
            flash[:errors] = @patient.errors.full_messages
            render :new 
        end 
    end 

    def show 
    end 

    def edit 
    end 

    def update 
        if @patient.update(patient_params)
            redirect_to patients_url
        else 
            flash[:errors] = @patient.errors.full_messages
            render :edit
        end 
    end 

    def index 
        @patients = Patient.search(params[:search])
    end 

    def destroy 
        @patient.destroy
        redirect_to patients_url
    end 


    private 
    def find_patient 
        @patient = Patient.find_by(id: params[:id])
    end 

    def find_user 
        @user = User.find_by(id: params[:user_id])
    end 
        
    def patient_params 
        params.require(:patient).permit(:name, :symptoms, :search,  appointment_attributes: [:appointment_id, :time], user_attributes:[:user_id, :name])
    end 

end
