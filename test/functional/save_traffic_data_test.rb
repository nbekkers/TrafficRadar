require 'test_helper'
require 'save_traffic_data'

class SaveTrafficDataTest < ActiveSupport::TestCase
  
  def setup
    @traffic = {
      :location => "Location", 
      :length => 456, 
      :travel_time_free_flow => 900,
      :velocity => 30,
      :travel_time => 990,
      :timestamp => "20130414170033"
    }
  end

  test "should save new traffic data for new location" do
    saveTrafficData = SaveTrafficData.new
    saveTrafficData.save @traffic
    
    found = Location.find(1)
    assert_equal "Location", found.name
    assert_equal 456, found.length
    assert_equal 900, found.travel_time_free_flow
  end
  
  test "should save traffic for existing location" do
    
  end
end