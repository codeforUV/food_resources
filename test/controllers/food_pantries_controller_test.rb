require 'test_helper'

class FoodPantriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_pantries_index_url
    assert_response :success
  end
end
