require "test/unit"
require "traffic_data_parser"

class TrafficDataParserTest < Test::Unit::TestCase

  attr_reader :parser

  def setup
    @parser = TrafficDataParser.new
  end

  def test_return_single_location_when_one_location
    parser.parse_json File.read("./test/resources/traffic_data_single_feature.json")

    traffic_data = parser.traffic_data

    assert_equal 1, traffic_data.size

    location = traffic_data[0]
    assert_equal "TrajectSensor_Route059", location[:location]
    assert_equal 961, location[:length]
    assert_equal 963, location[:travel_time_free_flow]
    assert_equal 2, location[:coordinates].size
    assert_equal [123289, 487663], location[:coordinates][0]
    assert_equal [123606, 487587], location[:coordinates][1]

    assert_equal Time.new(2013, 5, 18, 13, 18, 03), location[:timestamp]
    assert_equal 33, location[:velocity]
    assert_equal 103, location[:travel_time]
    assert_equal "#00FF00", location[:color]
  end

  def test_return_multiple_locations
    parser.parse_json File.read("./test/resources/traffic_data_three_features.json")

    traffic_data = parser.traffic_data

    assert_equal 3, traffic_data.size
  end
end