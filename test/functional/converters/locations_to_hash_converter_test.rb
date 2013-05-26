require 'test_helper'
require 'locations_to_hash_converter'

class LocationsToHashConverterTest < ActiveSupport::TestCase

  def setup
    @converter = LocationsToHashConverter.new
  end

  test "should return empty array for empty locations" do
    locations_hash = @converter.convert []
    assert_equal 0, locations_hash.size
  end

end