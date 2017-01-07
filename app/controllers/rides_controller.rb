class RidesController < ApplicationController

  def create

    @user = User.find(session[:user_id])

    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.create(attraction_id: @attraction.id, user_id: @user.id)

    flash[:notice] = @ride.take_ride

    redirect_to user_path(@user)
  end
end
