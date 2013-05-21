require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "save and get location" do
    location = Location.new
    location.name = "Location"
    location.length = 42
    location.travel_time_free_flow = 32

    location.save!

    locations = Location.all
    assert_equal 1, locations.size

    found = locations[0]
    assert_equal "Location", found.name
    assert_equal 42, found.length
    assert_equal 32, found.travel_time_free_flow
  end
end
