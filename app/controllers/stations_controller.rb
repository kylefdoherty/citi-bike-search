require 'pry'
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
        @final_start_stations = []
        @start_stations = Station.near(@start, 1)
        @start_stations.each do |station|
          @start_station_data = StationRefresher.current_station_data(station.station_id)
          @final_start_stations << [station, @start_station_data] if @start_station_data['availableBikes'] > 0
          break if @final_start_stations.length == 3
        end   
    else
        redirect to("/index") #give an error that you must give a start location 
    end

    if params[:end].present?
      @final_end_stations = []
      @end_stations = Station.near(@end, 1)
      @end_stations.each do |station|
          @end_station_data = StationRefresher.current_station_data(station.station_id)
          @final_end_stations << [station, @end_station_data] if @end_station_data['availableDocks'] > 0
          break if @final_end_stations.length == 3
      end
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

  post '/search' do
    @location = Location.create(address: params[:location])

    if params[:location].present?
        @final_stations = []
        @stations = Station.near(@location, 1)
        @stations.each do |station|
          @station_data = StationRefresher.current_station_data(station.station_id)
          @final_stations << [station, @station_data]
          break if @final_stations.length >= 10
        end   
    else
        redirect to("/index") #give an error that you must give a start location 
    end

    erb :'stations/search'
  end












end