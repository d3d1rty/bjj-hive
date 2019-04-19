# frozen_string_literal: true

##
# Model for user.
class User < ApplicationRecord
  include Clearance::User

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :handle, presence: true, length: { maximum: 15 }
end
