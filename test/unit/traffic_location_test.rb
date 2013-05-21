require 'test_helper'

class TrafficLocationTest < ActiveSupport::TestCase
  test "save and get traffic location" do
    traffic = TrafficLocation.new
    traffic.name = "Traffic"
    traffic.length = 42
    traffic.travel_time_free_flow = 32
    traffic.velocity = 30
    traffic.travel_time = 50
    traffic.timestamp = "20130415170000"

    traffic.save!

    locations = TrafficLocation.all
    assert_equal 1, locations.size

    found = locations[0]
    assert_equal "Traffic", found.name
    assert_equal 42, found.length
    assert_equal 32, found.travel_time_free_flow
    assert_equal 30, found.velocity
    assert_equal 50, found.travel_time
    assert_equal "20130415170000", found.timestamp
  end
end
