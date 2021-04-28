class CreateRecentArrivals < ActiveRecord::Migration[6.1]
  def change
    create_table :recent_arrivals do |t|
      t.name
      t.timestamps
    end
    add_reference :recent_arrivals, :food_access_point
  end
end
