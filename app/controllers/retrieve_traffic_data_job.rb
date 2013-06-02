require 'open-uri'
require 'traffic_data_parser'
require 'save_traffic_data'

class RetrieveTrafficDataJob

  URL = 'http://www.trafficlinkonline.nl/trafficlinkdata/wegdata/TrajectSensorsNH.GeoJSON'

  def self.retrieve
    puts  "#{Time.new.inspect}: Retrieving traffic data"
    contents  = open(URL) {|f| f.read }

    parser = TrafficDataParser.new
    parser.parse_json(contents)

    puts "Parsing #{parser.traffic_data.size} locations"
    parser.traffic_data.each do |traffic|
      saveTraffic = SaveTrafficData.new
      saveTraffic.save traffic
    end
  end

end