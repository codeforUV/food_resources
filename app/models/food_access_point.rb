class FoodAccessPoint < ApplicationRecord
  has_one :schedule
  scope :starts_with, ->(search_term) { where("name LIKE ?", "#{search_term}%") }
end
