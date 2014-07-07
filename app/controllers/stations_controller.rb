class StationsController < ApplicationController

  get '/' do 
    @stations = Station.all

    erb :"stations/index"
  end 

  get '/stations/:id' do
    @station = Station.find(params[:id])
    @current_data = Station.refresh_bike_count
    @current_station_data = @current_data.select {|s| s['id'] == @station.station_id}.first
    # binding.pry
    erb :"stations/show"
  end 

  post '/results' do
    @location = Location.create(address: params[:location])
    if params[:location].present?
        @stations = Station.near(@location, 1)
        if @stations.length > 5
            @stations = @stations[0..4]
        end
    else
        @stations = Station.all
    end

    erb :'stations/results'
  end

end