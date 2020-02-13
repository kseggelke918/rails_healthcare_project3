class UsersController < ApplicationController

    def show 
    end 


    def destroy 
        session.delete 
    end 
end
