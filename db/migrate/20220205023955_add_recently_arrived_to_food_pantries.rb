class AddRecentlyArrivedToFoodPantries < ActiveRecord::Migration[7.0]
  def change
    add_column :food_pantries, :recent_arrivals, :string
  end
end
