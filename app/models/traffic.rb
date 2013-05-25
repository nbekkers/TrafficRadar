class Traffic < ActiveRecord::Base
  self.table_name = "traffic"
  
  validates :location_id, :presence => true
  
  before_save :validate_location

  private
  def validate_location
    Location.find(location_id)
  end
end
