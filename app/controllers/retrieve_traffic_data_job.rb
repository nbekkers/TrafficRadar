require 'open-uri'
require 'traffic_data_parser'

class RetrieveTrafficDataJob

  def self.retrieve
    puts  "#{Date.now}: Retrieving traffic data"
    contents  = open('http://www.trafficlinkonline.nl/trafficlinkdata/wegdata/TrajectSensorsNH.GeoJSON') {|f| f.read }

    parser = TrafficDataParser.new
    parser.parse_json(contents)

    parser.traffic_data.each do |traffic|
      puts traffic[:location]
    end
  end

end