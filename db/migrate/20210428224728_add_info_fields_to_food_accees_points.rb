class AddInfoFieldsToFoodAcceesPoints < ActiveRecord::Migration[6.1]
  def change
    add_column :food_access_points, :income_qualifications, :text
    add_column :food_access_points, :required_docs, :text
    add_column :food_access_points, :typically_available_items, :text
  end
end
