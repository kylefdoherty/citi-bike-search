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

end