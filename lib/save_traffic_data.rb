class SaveTrafficData
  
  def save(data)
    location_id = save_location(data)
    save_traffic(location_id, data)
  end
  
  private
  def save_location(data)
    locations = Location.where(:name => data[:location])
    
    if locations.empty?
      location = Location.new
      location.name = data[:location]
    else
      location = locations[0]
    end
    
    location.length = data[:length]
    location.travel_time_free_flow = data[:travel_time_free_flow]
    location.save!
    location.id
  end
  
  def save_traffic(location_id, data)
    traffic = Traffic.new
    traffic.location_id = location_id
    traffic.timestamp = data[:timestamp]
    traffic.velocity = data[:velocity]
    traffic.travel_time = data[:travel_time]
    traffic.save!
  end
  
end