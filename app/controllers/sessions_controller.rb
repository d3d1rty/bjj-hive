# frozen_string_literal: true

##
# = SessionsController
# Author::    Richard Davis
#
# This controller provides methods for user sessions.
class SessionsController < Clearance::SessionsController
  ##
  # GET /sign_in
  def new; end

  ##
  # POST /session
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        ahoy.authenticate(@user)
        redirect_to events_path
      else
        redirect_to sign_in_path, alert: [status.failure_message]
      end
    end
  end

  private

  ##
  # Override default clearance behavior.
  def redirect_signed_in_users
    redirect_to url_for_signed_in_users if signed_in?
  end

  ##
  # Override default clearance behavior.
  def url_after_create
    events_path
  end

  ##
  # Override default clearance behavior.
  def url_after_destroy
    sign_in_url
  end

  ##
  # Override default clearance behavior.
  def url_for_signed_in_users
    url_after_create
  end
end
