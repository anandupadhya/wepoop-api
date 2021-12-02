class Toilet < ApplicationRecord
  belongs_to :user
  has_many :reviews
  reverse_geocoded_by :latitude, :longitude
end
