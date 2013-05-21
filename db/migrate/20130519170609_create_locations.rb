class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :length
      t.integer :travel_time_free_flow
      
      t.timestamps
    end
  end
end
