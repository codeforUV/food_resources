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
    if @food_access_point.save 
      redirect_to food_access_point_path(@food_access_point)
    else
      render 'edit'
    end
  end

  def edit
    @food_access_point = FoodAccessPoint.find(params[:id])
  end

  def update
    @food_access_point = FoodAccessPoint.find(params[:id])
    @food_access_point.update(food_access_point_params(:name, :address, :town, :state, :zip, :phone_number, :website))
    if @food_access_point.save
      redirect_to food_access_point_path(@food_access_point)
    else
      render 'edit'
    end
  end

  def destroy
    @food_access_point = FoodAccessPoint.find(params[:id])
    @food_access_point.destroy
    redirect_to root
  end

  private 

  def food_access_point_params(*args) 
    params.require(:food_access_point).permit(*args)
  end


end
