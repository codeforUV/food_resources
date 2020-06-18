class CreateFoodAccessPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :food_access_points do |t|
      t.string :address
      t.string :town
      t.string :state
      t.string :zip
      t.string :name
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end
