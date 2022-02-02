class DropFoodAccessPoints < ActiveRecord::Migration[7.0]
  def change
    remove_reference :food_access_points, :user, foreign_key: true

    drop_table :food_access_points do |t|
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
