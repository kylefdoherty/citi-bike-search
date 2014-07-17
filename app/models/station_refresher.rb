require_relative '../../config/environment.rb'
require_relative 'json_parser'
require 'geocoder'

class StationRefresher

  def refresh_bike_count
    # binding.pry
    parser = JSONParser.new("http://www.citibikenyc.com/stations/json")
    stations = parser.run
    stations.each do |station|
      s = Station.new
      s.available_docks = station[:availableDocks]
      s.available_bikes = station[:availableBikes]
      s.status = station[:statusValue]
    end
  end

  def self.current_station_data
    # binding.pry
    refresh_bike_count.select {|s| s['id'] == self.station_id}.first
  end 


end 