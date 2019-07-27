# frozen_string_literal: true

##
# = Post
# Author::    Richard Davis
#
# This model handles data and methods for post objects.
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :subject, use: :slugged

  belongs_to :user
  has_many :replies

  validates :subject, presence: true, length: { maximum: 75 }
  validates :body, presence: true, length: { maximum: 10_000 }
end
