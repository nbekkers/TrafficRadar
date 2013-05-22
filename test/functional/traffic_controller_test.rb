require 'test_helper'

class TrafficControllerTest < ActionController::TestCase

  test "Get empty traffic data without ids parameter given" do
    get :index

    assert_response :success

    json_response = JSON.parse @response.body
    assert_equal 0, json_response.size
  end

  test "Get empty traffic data when empty ids parameter given" do
    get :index, :ids => []

    assert_response :success

    json_response = JSON.parse @response.body
    assert_equal 0, json_response.size
  end
end