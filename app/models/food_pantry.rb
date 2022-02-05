class FoodPantry < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :town, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
end
