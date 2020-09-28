class FoodAccessPointsController < ApplicationController
  protect_from_forgery :except => :search

  def index
    @food_access_points = FoodAccessPoint.all
  end

  def show
    @food_access_point = FoodAccessPoint.find(params[:id])
  end

  def search
    @food_access_points = FoodAccessPoint.starts_with(params[:search_term].capitalize!)
  end
end
