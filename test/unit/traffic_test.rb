require 'test_helper'

class TrafficTest < ActiveSupport::TestCase
  
  test "should fail without location_id" do
    traffic = create_traffic 42
    traffic.location_id = nil
    
    assert_raise ActiveRecord::RecordInvalid do 
      traffic.save!
    end
  end
  
  test "should fail to save traffic for non-existing location" do
    traffic = create_traffic 42
    
    assert_raise ActiveRecord::RecordNotFound do 
      traffic.save!
    end
  end
  
  test "should save traffic for existing location" do
    location = save_location
    traffic = create_traffic(location)
    traffic.save!
    
    found = Traffic.all
    assert_equal 1, found.size
  end
  
  private
  
  def create_traffic(location_id)
    traffic = Traffic.new
    traffic.location_id = location_id
    traffic.timestamp = Time.now
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
