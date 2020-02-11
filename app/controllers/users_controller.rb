class UsersController < ApplicationController
    # create user - use devise  

    private 
    def user_params 
        params.require(:user), permit(:name, :specialty, :email, :password, :patient_id)
    end
end
