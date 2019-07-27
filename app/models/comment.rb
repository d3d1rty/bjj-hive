# frozen_string_literal: true

##
# = Comment
# Author::    Richard Davis
#
# This model handles data and methods for comment objects.
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_closure_tree dependent: :destroy

  validates :body, presence: true, length: { maximum: 10_000 }
end
