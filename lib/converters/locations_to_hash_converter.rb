class LocationsToHashConverter

  def convert(locations)
    loc_array = []

    locations.each do |loc|
      loc_array << {
          :id => loc.id,
          :name => loc.name,
          :length => loc.length,
          :travel_time_free_flow => loc.travel_time_free_flow
      }
    end

    loc_array
  end
end