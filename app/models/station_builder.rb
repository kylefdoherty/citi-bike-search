require_relative "json_parser"
require_relative 'station'

class StationBuilder 

  def self.build_stations
     parser = JSONParser.new("http://www.citibikenyc.com/stations/json")
     stations = parser.run
      stations.each_with_index do |station, index|
      s = Station.new
        s.tap do |x|
          x.station_id = station["id"]
          x.name = station["stationName"]
          x.total_docks = station["totalDocks"]
          x.latitude = station["latitude"]
          x.longitude = station["longitude"]
        end 
        s.save
      end 
  end 

end 


