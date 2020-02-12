class UsersController < ApplicationController
    # create user - use devise  
    before_action :find_user

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        
        if @user 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            redirect_to new_user_path 
        end 
    end 

    def show 

    end 


    private 

    def find_user 
        @user = User.find(params[:id])
    end 
    def user_params 
        params.require(:user).permit(:name, :specialty, :email, :password, :patient_id)
    end
end
