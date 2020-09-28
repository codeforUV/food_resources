class FoodAccessPoint < ApplicationRecord
  scope :starts_with, ->(search_term) { where("name LIKE ?", "#{search_term}%") }
end
