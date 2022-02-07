class FoodPantriesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    if params[:filter]
      if params[:filter] == "now"
        @food_pantries = FoodPantry.all.select { |food_pantry| food_pantry.open_now? }
      elsif params[:filter] == "today"
        @food_pantries = FoodPantry.all.select { |food_pantry| food_pantry.open_today? }
      end
    elsif params[:search]
      sanitized_search_param = ActiveRecord::Base.sanitize_sql_like(params[:search])
      @food_pantries = FoodPantry.where("typically_available ILIKE ?", "%#{sanitized_search_param}%").or(FoodPantry.where("recent_arrivals ILIKE ?", "%#{sanitized_search_param}%"))
    else
      @food_pantries = FoodPantry.all
    end
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
    food_pantry = FoodPantry.find(params[:id])
    food_pantry.destroy

    redirect_to root_path
  end

  private 

  def food_pantry_params
    params.require(:food_pantry).permit(
      :name,
      :address,
      :town,
      :state,
      :postal_code,
      :phone_1,
      :phone_2,
      :email,
      :url,
      :eligibility_criteria,
      :required_documents,
      :typically_available,
      :recent_arrivals,
      :notes
    )
  end
end
