class AddScheduleToFoodAccessPoints < ActiveRecord::Migration[6.0]
  def change
    add_reference :food_access_points, :schedule
  end
end
