class UsersController < ApplicationController
    before_action :find_user 

    def show 
    end 

    def destroy 
        session.delete 
    end 

    def user_profile
    end 

    def edit 
    end 

    def update 
        @user.update(user_params)
        if @user.valid?
            redirect_to user_profile_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end 
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :specialty)
    end 

    def find_user 
        @user = User.find_by(id: params[:id])
    end
    

end
