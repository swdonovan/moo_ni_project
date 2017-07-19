class SessionsController < ApplicationController

  def new
  end

  def create
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        flash[:notice] = "Login Successful"
        session[:user_id] = @user.id
      else
        redirect_to login_path
  end
end
