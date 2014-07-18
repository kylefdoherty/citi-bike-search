class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string  :name
      t.string  :address
      t.integer :station_id
      t.float   :latitude 
      t.float   :longitude 
      t.integer :total_docks
    end 
  end
end
