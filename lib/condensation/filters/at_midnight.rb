require 'active_support/time_with_zone'
require 'active_support/core_ext/time/calculations'

module Condensation
  module Filters
    module AtMidnight
      def at_midnight(input)
        return if input.nil?

        value = if input.is_a?(Time)
                  input
                else
                  begin
                    Time.parse(input)
                  rescue
                    nil
                  end
                end

        return input unless value.is_a?(Time)
        value.at_midnight
      end

      alias beginning_of_day at_midnight
    end
  end
end
