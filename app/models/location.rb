# frozen_string_literal: true

##
# = Location
# Author::    Richard Davis
#
# This model handles data and methods for location objects.
class Location < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true, length: { maximum: 150 }
  validates :street_address, presence: true, length: { maximum: 150 }
  validates :city, presence: true, length: { maximum: 150 }
  validates :state, presence: true, length: { maximum: 150 }
  validates :zip, presence: true, length: { maximum: 150 }
  validates :country, presence: true, length: { maximum: 150 }

  geocoded_by :address
  after_validation :geocode

  def address
    [street_address, city, state, zip, country].compact.join(', ')
  end

  def address_line_one
    street_address || ''
  end

  def address_line_two
    [city, state, zip, country].compact.join(', ') || ''
  end
end
