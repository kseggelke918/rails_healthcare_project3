class UsersController < ApplicationController
    # create user - use devise  

    def new 
        @user = User.new 
    end 

    def create 
        user = User.create(user_params)
        
        if user 
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else 
            render :new 
        end 
    end 


    private 
    def user_params 
        params.require(:user).permit(:name, :specialty, :email, :password, :patient_id)
    end
end
