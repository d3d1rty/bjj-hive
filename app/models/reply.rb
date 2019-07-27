# frozen_string_literal: true

##
# = Reply
# Author::    Richard Davis
#
# This model handles data and methods for reply objects.
class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_closure_tree dependent: :destroy

  validates :body, presence: true, length: { maximum: 10_000 }
end
