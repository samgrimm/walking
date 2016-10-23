class Walk < ApplicationRecord
  has_one :start_location
  has_one :end_location

  belongs_to :user

  accepts_nested_attributes_for :start_location
  accepts_nested_attributes_for :end_location
end
