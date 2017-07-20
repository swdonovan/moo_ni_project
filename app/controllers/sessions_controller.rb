class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:notice] = "Login Successful"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to '/login'
  end
end
