require 'rails_helper'

RSpec.describe FoodAccessPoint, type: :model do
  it "works?" do
    food_access_point = FoodAccessPoint.new(name: "test")
    
    expect(food_access_point.name).to eq("test")
  end
end
