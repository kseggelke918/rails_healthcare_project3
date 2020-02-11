class SessionsController < ApplicationController

  # do login and logout routes here 

  def new 
    #login 

  end 

  def create
    @user = User.find_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end 

    session[:user_id] = @user.id 

    redirect_to user_path(@user )
  end

  def destroy 
    #logout 
  end 

  private 

  def auth 
    request.env['omniauth.auth']
  end 
end
