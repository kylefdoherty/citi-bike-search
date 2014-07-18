require_relative "station_builder"
require_relative "station"
require 'httparty'
require_relative '../../config/environment'

class JSONParser
  attr_reader :url, :response

  def initialize(url)
    @url = url 
  end 

  def parse
    @response = HTTParty.get(self.url)
  end 

  def get_stations
    self.response["stationBeanList"]
  end 

  def run 
    parse
    get_stations
  end 

end 



