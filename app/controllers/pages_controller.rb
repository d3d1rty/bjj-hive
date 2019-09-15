# frozen_string_literal: true

##
# = PagesController
# Author::    Richard Davis
#
# This controller provides actions to access static pages.
class PagesController < ApplicationController
  ##
  # GET /
  def landing_page; end

  ##
  # GET /about
  def about; end

  ##
  # GET /privacy-policy
  def privacy_policy; end

  ##
  # GET /terms-of-service
  def terms_of_service; end

  ##
  # GET /contact-us
  def contact_us; end

  ##
  # POST /contact
  def contact
    if ContactUsMailer.send_inquiry(contact_params).deliver
      redirect_to root_path, notice: I18n.t('notices.contact_us.success')
    else
      redirect_to contact_us_path, alert: I18n.t('alerts.contact_us.failure')
    end
  end

  ##
  # GET /sitemap.xml
  def sitemap; end

  private

  ##
  # Filter parameters.
  def contact_params
    params.permit(%i[name email reason message])
  end
end
