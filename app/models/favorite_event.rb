# frozen_string_literal: true

##
# = FavoriteEvent
# Author::    Richard Davis
#
# This model handles data and methods for favorite event objects.
class FavoriteEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
