require 'rails_helper'

RSpec.describe FoodAccessPoint, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:schedules) }
  end
end
