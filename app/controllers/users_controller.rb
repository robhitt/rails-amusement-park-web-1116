class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)


    if @user #&& params[:user][:password] == params[:user][:password_confirmation]
      @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:notice] = 'Username or password was incorrect'
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
