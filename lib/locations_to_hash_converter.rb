class LocationsToHashConverter

  def convert(locations)
    loc_array = []
    locations.each do |loc|
      loc_array << {:id => loc.id, :name => loc.name}
    end
  end
end