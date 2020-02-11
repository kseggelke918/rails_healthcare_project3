class UsersController < ApplicationController
    # create user - use devise  

    def create 
        @user = User.find_or_create_by(name: params[:name])
        return head(:forbidden) unless @user.authenticate(params[:password])
    end 


    private 
    def user_params 
        params.require(:user).permit(:name, :specialty, :email, :password, :patient_id)
    end
end
