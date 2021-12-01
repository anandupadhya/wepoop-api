class Toilet < ApplicationRecord
  belongs_to :user
  has_many :reviews
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
