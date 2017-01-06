class UsersController < ApplicationController
before_action :authenticate_user, only: [:edit, :show, :update]

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
      flash[:notice] = 'Welcome to the theme park!'
      redirect_to user_path(@user)
    # else
    #   flash[:notice] = 'Username or password was incorrect'
    #   redirect_to root_path
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    @ride = Ride.create(attraction_id: @attraction.id, user_id: @user.id)
    binding.pry
    @ride.take_ride
    flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    redirect_to user_path(@user)
  end


  def show
    @user = User.find(params[:id])


  end

  private

  def user_params
    params.require(:user).permit(:name, :password,
    :nausea, :happiness, :tickets, :height, :admin)
  end
end
