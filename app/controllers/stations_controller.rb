class StationsController < ApplicationController

  get '/' do 
    @stations = Station.all

    erb :"stations/index"
  end 

  get '/stations/:id' do
    # Station.refresh_bike_count 
    @station = Station.find(params[:id])

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