class StartLocation < ApplicationRecord
  belongs_to :walk
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude,
  :address => :address
  after_validation :reverse_geocode
  after_validation :geocode
end
