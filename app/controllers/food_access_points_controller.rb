class FoodAccessPointsController < ApplicationController
  def index
    @food_access_points = FoodAccessPoint.all
  end

  def show
    @food_access_point = FoodAccessPoint.find(params[:id])
  end
end
