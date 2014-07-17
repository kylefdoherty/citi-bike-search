class StationsController < ApplicationController

  get '/' do 
    @stations = Station.all

    erb :"stations/index"
  end 

  get '/stations/:id' do
    @station = Station.find(params[:id])
    # @current_data = Station.refresh_bike_count
    # @current_station_data = @current_data.select {|s| s['id'] == @station.station_id}.first
    # binding.pry
    @current_station_data = StationRefresher.current_station_data(@station.station_id)
    erb :"stations/show"
  end 

  post '/results' do
    @start = Location.create(address: params[:start])
    @end = Location.create(address: params[:end])
    
    # start stations 
    if params[:start].present?
        @start_stations = Station.near(@start, 1).first
        @start_station_data = StationRefresher.current_station_data(@start_stations.station_id)
        # if @stations.length > 5
        #     @stations = @stations[0..2]
        # end
    else
        redirect to("/index") #give an error that you must give a start location 
    end

    if params[:end].present?
        @end_stations = Station.near(@end, 1).first
        @end_station_data = StationRefresher.current_station_data(@end_stations.station_id)
        # if @stations.length > 5
        #     @stations = @stations[0..2]
        # end
    else
        redirect to("/index") #give an error that you must give a start location 
    end

    # binding.pry

    erb :'stations/results'
  end

 



# {"locations"=>
#   [{"start"=>"11217",
#     "end"=>"11 broadway ny",
#     "start_station"=>"Dean St & 4 Ave",
#     "end_station"=>"Broadway & Battery Pl"}]

  post '/directions' do 
    # binding.pry
    @start = params[:locations][:start]
    @end = params[:locations][:end]
    @start_station = params[:locations][:start_station]
    @end_station = params[:locations][:end_station]

    #get the station so it can be inserted into the end point for directions 
    erb :'stations/directions'
  end 












end