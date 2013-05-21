require 'test_helper'

class TrafficLocationTest < ActiveSupport::TestCase
  test "save and get traffic location" do
    traffic = TrafficLocation.new
    traffic.name = "Traffic"
    traffic.length = 42
    traffic.travel_time_free_flow = 32

    traffic.save!

    locations = TrafficLocation.all
    assert_equal 1, locations.size

    found = locations[0]
    assert_equal "Traffic", found.name
    assert_equal 42, found.length
    assert_equal 32, found.travel_time_free_flow
  end
end
