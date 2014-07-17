require_relative '../../config/environment.rb'
require_relative 'json_parser'
require 'geocoder'

class Station < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
   reverse_geocoded_by :latitude, :longitude
   after_validation :reverse_geocode
   attr_accessor :available_bikes, :available_docks, :status
   def self.seed 
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