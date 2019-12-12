# frozen_string_literal: true

##
# = ApplicationController
# Author::    Richard Davis
#
# This controller provides methods inherited by other controllers.
class ApplicationController < ActionController::Base
  include Clearance::Controller

  ##
  # POST /accept_cookies
  def accept_cookies
    session[:accepted_cookies] = true
    flash.discard
    redirect_back(fallback_location: root_path)
  end

  private

  ##
  # Set user for action.
  def set_user
    @user = User.find(params[:user_id])
  end

  ##
  # Sets event for individual resource actions
  def set_event
    @event = Event.friendly.find(params[:id])
  end

  ##
  # Log user action for analytics.
  def track(event_name, event_attributes)
    ahoy.track event_name, event_attributes
  end

  ##
  # Protect user resources.
  def protect_user_resources
    return if current_user.id == params[:user_id].to_i || current_user.id == params[:id].to_i

    track('Unauthorized Access Attempt', user_id: current_user.id, url: request.fullpath)
    redirect_back fallback_location: root_path, alert: [I18n.t('alerts.unauthorized')]
  end

  ##
  # Verifies user has completed registration.
  def verify_registration_complete
    return if current_user.admin?
    return redirect_to organizer_prompt_path(current_user) unless current_user.selected_organizer?
    return redirect_to location_prompt_path(current_user) unless current_user.created_first_location?
  end

  ## Verifies user is an organizer.
  def verify_organizer
    return if current_user.organizer? || current_user.admin?

    track('Unauthorized Access Attempt', user_id: current_user.id, url: request.fullpath)
    redirect_back fallback_location: root_path, alert: [I18n.t('alerts.unauthorized')]
  end
end
