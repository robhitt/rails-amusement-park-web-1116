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

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attractions_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
  end

  private


  def attractions_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating,
    :happiness_rating, :min_height)
  end

end
