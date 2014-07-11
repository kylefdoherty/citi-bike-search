require_relative '../spec_helper' 

describe Station do
  let(:station) { 
    Station.new.tap do |s|
      s.station_id = 79
      s.name = "Franklin St & W Broadway"
      s.total_docks = 33
      s.latitude = 40.71911552
      s.longitude = -74.00666661
    end 
  }







  #describe #refresh_bike_count
    #it returns an array of bike stations 
  #describe #current_station_data
    #it selects the current data (real time data) for that station 

  #describe all the other methods (:name, :station_id, :latitude, :longitude, :total_docks)
   #it does xyz and prove that it works 
end