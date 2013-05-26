require 'save_traffic_data'

class SaveTrafficDataTest < ActiveSupport::TestCase
  
  def setup
    @timestamp = Time.now
    @traffic_data = {
      :location => "Location", 
      :length => 456, 
      :travel_time_free_flow => 900,
      :velocity => 30,
      :travel_time => 990,
      :color => "#009900",
      :timestamp => @timestamp
    }
  end

  test "should save new traffic data for new location" do
    saveTrafficData = SaveTrafficData.new
    saveTrafficData.save @traffic_data
    
    location = Location.find(1)
    assert_equal "Location", location.name
    assert_equal 456, location.length
    assert_equal 900, location.travel_time_free_flow
    
    traffic = Traffic.where(:location_id => 1)
    assert_equal 1, traffic.size
    assert_equal 30, traffic[0].velocity
    assert_equal 990, traffic[0].travel_time
    assert_equal "#009900", traffic[0].color
    assert_equal @timestamp, traffic[0].timestamp
  end
  
  test "should update location and save traffic for existing location" do
    saveTrafficData = SaveTrafficData.new
    saveTrafficData.save @traffic_data
    
    timestamp = Time.now
    other_traffic = {
      :location => "Location", 
      :length => 678, 
      :travel_time_free_flow => 1000,
      :velocity => 40,
      :travel_time => 980,
      :color => "#999999",
      :timestamp => timestamp
    }
    
    saveTrafficData.save other_traffic
    assert_equal 1, Location.all.size
    
    found = Location.find(1)
    assert_equal "Location", found.name
    assert_equal 678, found.length
    assert_equal 1000, found.travel_time_free_flow
    
    traffic = Traffic.where(:location_id => 1)
    assert_equal 2, traffic.size
  end
end