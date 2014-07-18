require "geocoder"
class Location < ActiveRecord::Base
    extend Geocoder::Model::ActiveRecord
    
    geocoded_by :address
    after_validation :geocode, :if => :address_changed?
    
end