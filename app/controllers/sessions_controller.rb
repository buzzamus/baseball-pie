class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      @message = "You are logged in as #{user.username}"
      redirect_to root_path
    else
      @message = "There was an issue with your login attempt."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    @message = "You are now logged out"
    redirect_to root_path
  end
end
