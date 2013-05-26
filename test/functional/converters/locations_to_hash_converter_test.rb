require 'test_helper'
require 'locations_to_hash_converter'

class LocationsToHashConverterTest < ActiveSupport::TestCase

  LOCATION_ID = 1
  LOCATION_NAME = "Loc2"

  def setup
    @converter = LocationsToHashConverter.new
  end

  test "should return empty array for empty locations" do
    locations_hash = @converter.convert []
    assert_equal 0, locations_hash.size
  end

  test "should return location hash when one location given" do
    loc = create_location(LOCATION_ID, LOCATION_NAME)

    hash = @converter.convert [loc]
    assert_equal 1, hash.size

    assert_location LOCATION_ID, LOCATION_NAME, hash[0]
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