# frozen_string_literal: true

##
# = HiveTime
# Author::    Richard Davis
#
# This provides the namespace for HiveTime methods.
module HiveTime
  def params_to_time(hour, min, period, zone)
    return unless !hour.nil? && !min.nil? && !period.nil? && !zone.nil?

    "#{(period.casecmp?('pm') && hour.to_i != 12) || (period.casecmp?('am') && hour.to_i == 12) ? convert_hour_to_24_time(hour) : hour}:#{min}".in_time_zone(zone)
  end

  def convert_hour_to_24_time(hour)
    (hour.to_i + 12) > 23 ? '00' : hour.to_i + 12
  end
end
