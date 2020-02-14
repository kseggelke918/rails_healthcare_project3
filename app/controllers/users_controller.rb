class UsersController < ApplicationController
    before_action :find_user 

    def show 
    end 

    def destroy 
        session.delete 
    end 

    private 

    def user_parms
        params.require(:user).permit(:name, :specialty)
    end 

    def find_user 
        @user = User.find_by(id: params[:id])
    end
    

end
