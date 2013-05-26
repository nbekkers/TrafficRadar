require "traffic_to_hash_parser"

class TrafficToHashParserTest < ActiveSupport::TestCase

  def setup
    @parser = TrafficToHashParser.new
  end

  def test_getting_empty_hash_when_no_traffic_given
    assert_equal 0, @parser.parse([]).size
  end

  def test_parsing_single_traffic_object
    timestamp = Time.utc(2013, 5, 6, 12, 30, 45)
    traffic = create_traffic(3, timestamp, 42, 123, "#dfdfdf")

    traffic_per_location = @parser.parse([traffic])

    assert_equal 1, traffic_per_location.size
    assert_equal 3, traffic_per_location[0][:location_id]
    assert_equal 1, traffic_per_location[0][:traffic].size
    assert_equal "20130506123045", traffic_per_location[0][:traffic][0][:timestamp]
    assert_equal 42, traffic_per_location[0][:traffic][0][:velocity]
    assert_equal 123, traffic_per_location[0][:traffic][0][:travel_time]
    assert_equal "#dfdfdf", traffic_per_location[0][:traffic][0][:color]
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

end