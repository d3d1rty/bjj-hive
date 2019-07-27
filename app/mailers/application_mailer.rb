# frozen_string_literal: true

##
# Base mailer for application.
class ApplicationMailer < ActionMailer::Base
  default from: "noreply@#{ENV['APP_DOMAIN']}"
  layout 'mailer'
end
