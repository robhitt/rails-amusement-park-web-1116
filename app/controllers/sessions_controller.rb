class SessionsController < ApplicationController

  def new
    # @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back to the theme park!"
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Username or password was incorrect'
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'Logged out!'
    redirect_to root_path
  end

end
