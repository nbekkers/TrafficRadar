require "traffic_to_hash_parser"

class TrafficToHashParserTest < ActiveSupport::TestCase

  LOCATION_ID = 3
  LOCATION_ID2 = 4

  def setup
    @parser = TrafficToHashParser.new

    @timestamp = Time.utc(2013, 5, 6, 12, 30, 45)
    @timestamp2 = Time.utc(2013, 5, 7, 13, 14, 15)

    @traffic1 = create_traffic(LOCATION_ID, @timestamp, 42, 123, "#dfdfdf")
    @traffic2 = create_traffic(LOCATION_ID, @timestamp2, 32, 321, "#aeaeae")
  end

  def test_getting_empty_hash_when_no_traffic_given
    assert_equal 0, @parser.parse([]).size
  end

  def test_parsing_single_traffic_object
    traffic = create_traffic(LOCATION_ID, @timestamp, 42, 123, "#dfdfdf")
    traffic_per_location = @parser.parse([traffic])

    assert_equal 1, traffic_per_location.size
    assert_equal LOCATION_ID, traffic_per_location[0][:location_id]
    assert_equal 1, traffic_per_location[0][:traffic].size

    assert_traffic traffic_per_location[0][:traffic][0], "2013-05-06T12:30:45Z", 42, 123, "#dfdfdf"
  end

  def test_parsing_two_traffic_objects_for_same_location
    traffic_per_location = @parser.parse([@traffic1, @traffic2])

    assert_equal 1, traffic_per_location.size
    assert_equal LOCATION_ID, traffic_per_location[0][:location_id]
    assert_equal 2, traffic_per_location[0][:traffic].size

    assert_traffic traffic_per_location[0][:traffic][0], "2013-05-06T12:30:45Z", 42, 123, "#dfdfdf"
    assert_traffic traffic_per_location[0][:traffic][1], "2013-05-07T13:14:15Z", 32, 321, "#aeaeae"
  end

  def test_parsing_two_traffic_objects_for_different_location
    @traffic2.location_id = LOCATION_ID2
    traffic_per_location = @parser.parse([@traffic1, @traffic2])

    assert_equal 2, traffic_per_location.size
    assert_equal LOCATION_ID, traffic_per_location[0][:location_id]
    assert_equal 1, traffic_per_location[0][:traffic].size

    assert_equal LOCATION_ID2, traffic_per_location[1][:location_id]
    assert_equal 1, traffic_per_location[1][:traffic].size

    assert_traffic traffic_per_location[0][:traffic][0], "2013-05-06T12:30:45Z", 42, 123, "#dfdfdf"
    assert_traffic traffic_per_location[1][:traffic][0], "2013-05-07T13:14:15Z", 32, 321, "#aeaeae"
  end

  private
  def create_traffic(loc_id, timestamp, velocity, travel_time, color)
    traffic = Traffic.new
    traffic.location_id = loc_id
    traffic.timestamp = timestamp
    traffic.velocity = velocity
    traffic.travel_time = travel_time
    traffic.color = color
    traffic
  end

  def assert_traffic(traffic, timestamp, velocity, travel_time, color)
    assert_equal timestamp, traffic[:timestamp]
    assert_equal velocity, traffic[:velocity]
    assert_equal travel_time, traffic[:travel_time]
    assert_equal color, traffic[:color]
  end

end