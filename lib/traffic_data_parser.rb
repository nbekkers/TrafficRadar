require 'json'

class TrafficDataParser

  attr_reader :traffic_data

  def initialize
    @traffic_data = []
  end

  def parse_json(to_parse)
    parsed = JSON.parse(to_parse)

    parsed['features'].each do |features|
      @traffic_data << parse_features(features)
    end
  end

  private
  def parse_features(features)
    location = {}

    features.each do |key, value|
      if key == 'properties'
        location[:location] = value['LOCATION']
        location[:length] = value['LENGTH']
        location[:travel_time_free_flow] = value['TRAVELTIME_FF']

        location[:timestamp] = value['TIMESTAMP']
        location[:color] = value['COLOR']
        location[:velocity] = value['VELOCITY']
        location[:travel_time] = value['TRAVELTIME']
      end

      if key == 'geometry'
        location[:coordinates] = value['coordinates']
      end
    end

    location
  end
end