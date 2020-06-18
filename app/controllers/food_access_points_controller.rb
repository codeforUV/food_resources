class FoodAccessPointsController < ApplicationController
  def index
    @food_access_points = FoodAccessPoint.all
  end
end
