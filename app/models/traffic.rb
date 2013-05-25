class Traffic < ActiveRecord::Base
  self.table_name = "traffic"
  
  validates :location_id, :presence => true
  
  before_save :validate_location

  def self.find_for_last_hour(location_ids)
    []
  end

  private
  def validate_location
    Location.find(location_id)
  end
end
