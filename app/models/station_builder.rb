require_relative "json_parser"
# require_relative "station"

require 'pry'
require 'active_record'


class StationBuilder 

  # def self.run 
  #   build_stations
  # end

  # def self.seed 
  #   bidning.pry
  #    parser = JSONParser.new("http://www.citibikenyc.com/stations/json")
  #    stations = parser.run
  #     stations.each_with_index do |station, index|
  #     s = Station.new
  #       s.tap do |s|
  #         s.station_id = station["id"]
  #         s.station_name = station["stationName"]
  #         s.total_docks = station["totalDocks"]
  #         s.latitude = station["latitude"]
  #         s.longitude = station["longitude"]
  #       end 
  #     s.save
  #   end 
  # end  

  # def self.build_stations
  #   parser = JSONParser.new("http://www.citibikenyc.com/stations/json")
  #   binding.pry
  #   stations = parser.run
  #   stations.each_with_index do |station, index|
  #     s = Station.new
  #       s.tap do |s|
  #         s.station_id = station["id"]
  #         s.station_name = station["stationName"]
  #         s.available_docks = station["availableDocks"]
  #         s.total_docks = station["totalDocks"]
  #         s.latitude = station["latitude"]
  #         s.longitude = station["longitude"]
  #         s.status_value = station["statusValue"]
  #         s.available_bikes = station["availableBikes"]
  #         s.st_address1 = station["stAddress1"]
  #         s.id = (index + 1)
  #       end 
  #   end 
  # end

  def self.method 
    # binding.pry
  end 



end 

StationBuilder.method
