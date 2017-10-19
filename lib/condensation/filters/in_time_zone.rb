require 'active_support/time_with_zone'
require 'active_support/core_ext/time/calculations'

module Condensation
  module Filters
    module InTimeZone
      def in_time_zone(input, zone_name = nil)
        zone = Time.find_zone(zone_name)
        return input if zone.nil?

        converted_time = if input.is_a?(Time)
                           input.in_time_zone(zone)
                         else
                           zone.parse(input)
                         end

        converted_time
      end
    end
  end
end
