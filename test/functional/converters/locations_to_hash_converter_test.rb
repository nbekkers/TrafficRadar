require 'test_helper'
require 'locations_to_hash_converter'

class LocationsToHashConverterTest < ActiveSupport::TestCase

  LOCATION_ID = 1
  LOCATION_NAME = "Loc1"

  LOCATION_ID2 = 2
  LOCATION_NAME2 = "Loc2"

  def setup
    @location = create_location(LOCATION_ID, LOCATION_NAME)
    @location2 = create_location(LOCATION_ID2, LOCATION_NAME2)

    @converter = LocationsToHashConverter.new
  end

  test "should return empty array for empty locations" do
    locations_hash = @converter.convert []
    assert_equal 0, locations_hash.size
  end

  test "should return array with one location when one location given" do
    hash = @converter.convert [@location]
    assert_equal 1, hash.size

    assert_location LOCATION_ID, LOCATION_NAME, hash[0]
  end

  test "should return array with two locations when two locations given" do
    hash = @converter.convert [@location, @location2]
    assert_equal 2, hash.size

    assert_location LOCATION_ID, LOCATION_NAME, hash[0]
    assert_location LOCATION_ID2, LOCATION_NAME2, hash[1]
  end

  private
  def create_location(id, name)
    l = Location.new
    l.id = id
    l.name = name
    l
  end

  def assert_location(id, name, loc_hash)
    assert_equal id, loc_hash[:id]
    assert_equal name, loc_hash[:name]
  end

end