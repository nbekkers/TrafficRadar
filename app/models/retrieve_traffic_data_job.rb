require 'open-uri'

class RetrieveTrafficDataJob

  def self.retrieve
    contents  = open('http://www.trafficlinkonline.nl/trafficlinkdata/wegdata/TrajectSensorsNH.GeoJSON') {|f| f.read }

    File.open("traffic_data.json", 'w') { |file| file.write(contents) }
  end

end