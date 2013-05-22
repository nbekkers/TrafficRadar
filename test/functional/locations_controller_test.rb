require 'test_helper'

class LocationsControllerTest < ActionController::TestCase

  test "should get empty locations when none present" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end
  
  test "should get single locations as json" do
    save_location

    get :index

    json_response = JSON.parse @response.body
    assert_equal 1, json_response[0]['id']
    assert_equal "Location", json_response[0]['name']
    assert_equal 42, json_response[0]['length']
    assert_equal 90, json_response[0]['travel_time_free_flow']
  end

  test "should get multiple locations as json" do
    save_location
    save_location

    get :index
    json_response = JSON.parse @response.body
    assert_equal 2, json_response.size
  end

  private
  def save_location
    loc = Location.new
    loc.name = "Location"
    loc.length = 42
    loc.travel_time_free_flow = 90
    loc.save!
  end
end
