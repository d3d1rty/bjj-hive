# frozen_string_literal: true

##
# = ApplicationHelper
# Author::    Richard Davis
#
# This helper module provides methods for use across application views.
module ApplicationHelper
  def format_date_and_zone(date, time_zone)
    "#{date}  #{Time.now.in_time_zone(time_zone).strftime('(%Z)')}"
  end

  def format_currency(money)
    "$#{number_with_precision(money, precision: 2)}"
  end
end
