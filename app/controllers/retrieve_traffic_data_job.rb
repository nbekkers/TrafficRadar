require 'open-uri'
require 'traffic_data_parser'

class RetrieveTrafficDataJob

  def self.retrieve
    puts  "#{Time.new.inspect}: Retrieving traffic data"
    contents  = open('http://www.trafficlinkonline.nl/trafficlinkdata/wegdata/TrajectSensorsNH.GeoJSON') {|f| f.read }

    parser = TrafficDataParser.new
    parser.parse_json(contents)

    puts "Parsing #{parser.traffic_data.size} locations"
    parser.traffic_data.each do |traffic|
      location = TrafficLocation.new
      location.name = traffic[:location]
      location.length = traffic[:length]
      location.travel_time_free_flow = traffic[:travel_time_free_flow]
      location.velocity = traffic[:velocity]
      location.travel_time = traffic[:travel_time]
      location.timestamp = traffic[:timestamp]

      location.save!
    end
  end

end