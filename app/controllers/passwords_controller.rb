# frozen_string_literal: true

##
# = PasswordsController
# Author::    Richard Davis
#
# This controller provides methods for user sessions.
class PasswordsController < Clearance::PasswordsController
  def deliver_email(user)
    ClearanceMailer.change_password(user).deliver
  end
end
