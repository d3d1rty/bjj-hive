# frozen_string_literal: true

##
# = ContactUsMailer
# Author::    Richard Davis
#
# Mailer for Contact Us form.
class ContactUsMailer < ApplicationMailer
  def send_inquiry(details)
    @details = details
    mail to: ENV['CONTACT_ADDRESS'], subject: I18n.t('mail.contact_us.subject')
  end
end
