class CreateTrafficLocations < ActiveRecord::Migration
  def change
    create_table :traffic_locations do |t|
      t.string :name
      t.integer :length
      t.integer :travel_time_free_flow
      t.integer :velocity
      t.integer :travel_time
      t.string :timestamp
    end
  end
end
