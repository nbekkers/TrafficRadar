class TrafficToHashParser

  def parse(traffic_data)
    @hash_array = []

    traffic_data.each do |traffic|
      store_for_location_id(traffic.location_id, parse_traffic(traffic))
    end

    @hash_array
  end

  private
  def store_for_location_id(location_id, traffic_hash)
    @hash_array.each do |traffic_for_location|
      if traffic_for_location[:location_id] == location_id
        traffic_for_location[:traffic] << traffic_hash
        return
      end
    end

    @hash_array << {:location_id => location_id, :traffic => [traffic_hash]}
  end

  def parse_traffic(t)
    {:timestamp => convert_timestamp(t.timestamp), :velocity => t.velocity, :travel_time => t.travel_time, :color => t.color}
  end

  def convert_timestamp(timestamp)
    timestamp.utc.iso8601
  end
end