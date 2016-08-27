class Position < ActiveRecord::Base
  belongs_to :artist

  geocoded_by :name, latitude: :latitude, longitude: :longitude
  before_validation :geocode
end