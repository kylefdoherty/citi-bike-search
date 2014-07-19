class StationsController < ApplicationController

  get '/' do 
    @stations = Station.all

    erb :"stations/index"
  end 

  get '/stations/:id' do
    @station = Station.find(params[:id])
    @current_station_data = StationRefresher.current_station_data(@station.station_id)
    erb :"stations/show"
  end 

  
  #refactor to make smaller
  post '/results' do
    @start = Location.create(address: params[:start])
    @end = Location.create(address: params[:end])

    if params[:start].present?
        @start_stations1 = Station.near(@start, 1)[0]
        @start_stations2 = Station.near(@start, 1)[1]
        # binding.pry
        @start_station_data1 = StationRefresher.current_station_data(@start_stations1.station_id)
        @start_station_data2 = StationRefresher.current_station_data(@start_stations2.station_id)
    else
        redirect to("/index") #give an error that you must give a start location 
    end

    if params[:end].present?
        @end_stations1 = Station.near(@end, 1)[0]
        @end_stations2 = Station.near(@end, 1)[1]

        @end_station_data1 = StationRefresher.current_station_data(@end_stations1.station_id)
        @end_station_data2 = StationRefresher.current_station_data(@end_stations2.station_id)
    else
        redirect to("/index") 
    end

    erb :'stations/results'
  end


  post '/directions' do 
    @start = params[:locations][:start]
    @end = params[:locations][:end]
    @start_station = params[:locations][:start_station]
    @end_station = params[:locations][:end_station]

    # erb :'stations/directions'
    erb :'stations/directions', :layout => :directions_layout
  end 












end