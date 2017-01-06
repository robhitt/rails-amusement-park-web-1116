class AttractionsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    #@attraction = Attraction.find()
  end

end
