require 'test_helper'

class TrafficTest < ActiveSupport::TestCase
  test "should fail to save traffic for non-existing location" do
    traffic = Traffic.new
    traffic.location_id = 42
    traffic.timestamp = Time.now
    traffic.velocity = 67
    traffic.travel_time = 123
    traffic.color = "#00FF00"
    
    assert_raise ActiveRecord::RecordInvalid do 
      traffic.save!
    end
  end
end
