class SaveTrafficData
  
  def save(traffic)
    location = TrafficLocation.new
    location.name = traffic[:location]
    location.length = traffic[:length]
    location.travel_time_free_flow = traffic[:travel_time_free_flow]

    location.save!
  end
  
end