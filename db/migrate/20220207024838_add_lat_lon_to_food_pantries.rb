class AddLatLonToFoodPantries < ActiveRecord::Migration[7.0]
  def change
    add_column :food_pantries, :latitude, :decimal
    add_column :food_pantries, :longitude, :decimal
    add_index :food_pantries, [:latitude, :longitude]
  end
end
