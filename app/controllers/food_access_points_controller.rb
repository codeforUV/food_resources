class FoodAccessPointsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @food_access_points = FoodAccessPoint.all
  end

  def show
    @food_access_point = FoodAccessPoint.find(params[:id])
  end
  
  def new
    @food_access_point = FoodAccessPoint.new
  end

  def create
    Rails.logger.debug params.inspect
    @food_access_point = current_user.food_access_points.build(food_access_point_params(:name, :address, :town, :state, :zip, :phone_number, :website))
  end

  def edit
    @food_access_point = FoodAccessPoint.find(params[:id])
  end

  def update

  end

  def destroy
  end

  private 

  def food_access_point_params(*args) 
    params.require(:food_access_point).permit(*args)
  end


end
