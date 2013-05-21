class SaveTrafficData
  
  def save(traffic)
    save_location(traffic)
  end
  
  private
  def save_location(traffic)
    locations = Location.where(:name => traffic[:location])
    
    if locations.empty?
      location = Location.new
      location.name = traffic[:location]
    else
      location = locations[0]
    end
    
    location.length = traffic[:length]
    location.travel_time_free_flow = traffic[:travel_time_free_flow]
    location.save!
  end
  
end