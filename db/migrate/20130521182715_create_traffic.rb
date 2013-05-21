class CreateTraffic < ActiveRecord::Migration
  def change
    create_table :traffic do |t|
      t.integer :location_id
      t.datetime :timestamp
      t.integer :velocity
      t.integer :travel_time
      t.string :color
    end
  end
end