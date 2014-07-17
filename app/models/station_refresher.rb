require_relative '../../config/environment.rb'
require_relative 'json_parser'
require 'geocoder'

class StationRefresher

  def self.refresh_bike_count
    parser = JSONParser.new("http://www.citibikenyc.com/stations/json")
    stations = parser.run
    stations.each do |station|
      s = Station.new
      s.available_docks = station[:availableDocks]
      s.available_bikes = station[:availableBikes]
      s.status = station[:statusValue]
    end
  end

  def self.current_station_data(station_id)
    refresh_bike_count.select {|s| s['id'] == station_id}.first
  end 


end 