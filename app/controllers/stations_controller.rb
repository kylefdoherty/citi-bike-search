require 'pry'
require 'gon-sinatra'
require 'rack-flash'

class StationsController < ApplicationController
  register Gon::Sinatra
  enable :sessions
  use Rack::Flash

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end
  

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
        if  @start_stations.length == 0
          flash[:notice] = "Sorry! There are no bikes by your start location"
          redirect to("/")
        end  
        @start_stations.each do |station|
          @start_station_data = StationRefresher.current_station_data(station.station_id)
          @final_start_stations << [station, @start_station_data] if @start_station_data['availableBikes'] > 0
          break if @final_start_stations.length == 3
        end 
    else
        flash[:notice] = "Invalid start location"
        redirect to("/") #give an error that you must give a start location 
    end

    if params[:end].present?
      @final_end_stations = []
      @end_stations = Station.near(@end, 1)
      if  @end_stations.length == 0
          flash[:notice] = "Sorry! There are no bikes by your end location"
          redirect to("/")
      end
      @end_stations.each do |station|
          @end_station_data = StationRefresher.current_station_data(station.station_id)
          @final_end_stations << [station, @end_station_data] if @end_station_data['availableDocks'] > 0
          break if @final_end_stations.length == 3
      end
    else
        flash[:notice] = "Invalid end location"
        redirect to("/") 
    end
    erb :'stations/results'
  end


  post '/directions' do 
    @start = params[:locations][:start]
    @end = params[:locations][:end]
    unless params[:locations][:start_station] && params[:locations][:end_station] 
      flash[:notice] = "Please choose a start and end location"
      erb :'stations/results'
    end
    @start_station = params[:locations][:start_station].split(" ")
    @end_station = params[:locations][:end_station].split(" ")
    # binding.pry

    # erb :'stations/directions'
    erb :'stations/directions', :layout => :directions_layout
  end 

  post '/search' do
    @location = Location.create(address: params[:location])

    if params[:location].present?
        @final_stations = []
        @station_coors = []
        @stations = Station.near(@location, 1)
        if  @stations.length == 0
          flash[:notice] = "Sorry! There are no bikes by your start location"
          redirect to("/")
        end
        station_letters = ["A", "B","C","D","E","F"].to_enum
        @stations.each do |station|
          station_letter = station_letters.next
          @station_data = StationRefresher.current_station_data(station.station_id)
          @final_stations << [station, @station_data, station_letter]
          @station_coors << [@station_data["latitude"], @station_data["longitude"]]
          break if @final_stations.length >= 6
        end  
        gon.station_coors = @station_coors
        gon.search_location = @location
    else
        flash[:notice] = "Invalid location"
        redirect to("/") #give an error that you must give a start location 
    end

    erb :'stations/search', :layout => :search_layout
  end

end