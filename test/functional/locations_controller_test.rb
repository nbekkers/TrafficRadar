require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get empty locations when none present" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end
  
  test "should get all locations" do
    
  end
end
