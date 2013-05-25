require 'test_helper'

class TrafficTest < ActiveSupport::TestCase
  
  test "should fail without location_id" do
    traffic = create_traffic(nil, Time.now)
    
    assert_raise ActiveRecord::RecordInvalid do 
      traffic.save!
    end
  end
  
  test "should fail to save traffic for non-existing location" do
    traffic = create_traffic(42, Time.now)
    
    assert_raise ActiveRecord::RecordNotFound do 
      traffic.save!
    end
  end
  
  test "should save traffic for existing location" do
    timestamp = Time.now
    
    location = save_location
    traffic = create_traffic(location, timestamp)
    traffic.save!
    
    found = Traffic.all
    assert_equal 1, found.size
    
    assert_equal timestamp, found[0].timestamp
    assert_equal 67, found[0].velocity
    assert_equal 123, found[0].travel_time
    assert_equal "#00FF00", found[0].color
  end

  test "should get empty traffic for last hour when no location given" do

  end

  test "should get traffic for last hour" do

  end
  
  private
  def create_traffic(location_id, timestamp)
    traffic = Traffic.new
    traffic.location_id = location_id
    traffic.timestamp = timestamp
    traffic.velocity = 67
    traffic.travel_time = 123
    traffic.color = "#00FF00"
    traffic
  end
   
  def save_location
    location = Location.new
    location.name = "Location"
    location.length = 42
    location.travel_time_free_flow = 32
    location.save!
  end
end
