require 'test_helper'

class FoodAccessPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_access_points_index_url
    assert_response :success
  end

end
