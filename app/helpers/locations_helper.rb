# frozen_string_literal: true

##
# = LocationsHelper
# Author::    Richard Davis
#
# This helper module provides methods for use across locations views.
module LocationsHelper
  def format_address(location)
    address = +''
    address << location.address_line_one + "\n" unless location.address_line_one.empty?
    address << location.address_line_two unless location.address_line_two.empty?
    simple_format(address)
  end
end
