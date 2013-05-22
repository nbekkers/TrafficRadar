require 'test_helper'

class TrafficControllerTest < ActionController::TestCase

  test "get empty traffic data without ids parameter given" do
    get :index

    assert_response :success

    json_response = JSON.parse @response.body
    assert_equal 0, json_response.size
  end

  test "get empty traffic data when empty ids parameter given" do
    get :index, :ids => []

    assert_response :success

    json_response = JSON.parse @response.body
    assert_equal 0, json_response.size
  end

  test "get traffic data for single location" do
    timestamp = Time.now
    location_id = 2
    save_location location_id
    save_traffic location_id, timestamp

    get :index, :ids => [2]

    assert_response :success

    json_response = JSON.parse @response.body
    assert_equal 1, json_response.size
    assert_equal location_id, json_response[0]['location_id']
    assert_equal timestamp.utc.iso8601, json_response[0]['timestamp']
    assert_equal 67, json_response[0]['velocity']
    assert_equal 123, json_response[0]['travel_time']
    assert_equal "#00FF00", json_response[0]['color']
  end

  private

  def save_location(location_id)
    loc = Location.new
    loc.id = location_id
    loc.name = "Location"
    loc.length = 42
    loc.travel_time_free_flow = 90
    loc.save!
  end

  def save_traffic(location_id, timestamp)
    traffic = Traffic.new
    traffic.location_id = location_id
    traffic.timestamp = timestamp
    traffic.velocity = 67
    traffic.travel_time = 123
    traffic.color = "#00FF00"
    traffic.save!
  end
end