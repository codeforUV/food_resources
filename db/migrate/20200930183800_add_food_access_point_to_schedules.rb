class AddFoodAccessPointToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :food_access_point
  end
end
