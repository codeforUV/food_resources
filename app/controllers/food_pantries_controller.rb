class FoodPantriesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    @food_pantries = FoodPantry.all
  end

  def show
    @food_pantry = FoodPantry.find(params[:id])
  end
  
  def new
    @food_pantry = current_user.food_pantries.build
  end

  def create
    @food_pantry = current_user.food_pantries.build(food_pantry_params)

    if @food_pantry.save 
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @food_pantry = current_user.food_pantries.find(params[:id])
  end

  def update
    @food_pantry = current_user.food_pantries.find(params[:id])

    if @food_pantry.update(food_pantry_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @food_pantry = FoodPantry.find(params[:id])
    @food_pantry.destroy
    redirect_to root_path
  end

  private 

  def food_pantry_params
    params.require(:food_pantry).permit(:name, :address, :town, :state, :postal_code, :phone_1, :phone_2)
  end
end
