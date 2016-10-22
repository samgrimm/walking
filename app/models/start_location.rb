class StartLocation < ApplicationRecord
  belongs_to :walk
  geocoded_by :address
  after_validation :geocode
end
