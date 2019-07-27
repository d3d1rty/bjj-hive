# frozen_string_literal: true

##
#  blah
class PagesController < ApplicationController
  ##
  # GET /about
  def about; end

  ##
  # GET /privacy_policy
  def privacy_policy; end

  ##
  # GET /terms_of_service
  def terms_of_service; end

  ##
  # GET /contact_us
  def contact_us; end

  ##
  # POST /contact_us
  def contact
    if ContactUsMailer.send_inquiry(contact_params).deliver
      redirect_to root_path, notice: I18n.t('notices.contact_us.success')
    else
      redirect_to contact_us_path, alert: I18n.t('alerts.contact_us.failure')
    end
  end

  ##
  # GET /help/markdown
  def markdown; end

  private

  def contact_params
    params.permit(%i[name email reason message])
  end
end
