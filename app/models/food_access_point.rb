class FoodAccessPoint < ApplicationRecord
  has_many :schedules
  has_many :recent_arrivals
  belongs_to :user

end
