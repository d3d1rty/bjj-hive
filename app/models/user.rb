# frozen_string_literal: true

##
# = User
# Author::    Richard Davis
#
# This model handles data and methods for user objects.
class User < ApplicationRecord
  include Clearance::User

  has_many :events
  has_many :locations
  has_many :favorite_events
  has_many :favorites, through: :favorite_events, source: :event
  has_many :posts
  has_many :replies

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :handle, presence: true, length: { maximum: 50 }

  def selected_organizer?
    !organizer.nil?
  end

  def created_first_location?
    !organizer? || (organizer? && locations.all.present?)
  end
end
