require_relative '../../config/environment.rb'
require_relative 'json_parser'
require 'geocoder'

class Station < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
   reverse_geocoded_by :latitude, :longitude
   after_validation :reverse_geocode
   attr_accessor :available_bikes, :available_docks, :status
   
end