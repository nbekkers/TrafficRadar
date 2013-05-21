class Traffic < ActiveRecord::Base
  self.table_name = "traffic"
  
  belongs_to :location
  validates :location, :existence => true
end
