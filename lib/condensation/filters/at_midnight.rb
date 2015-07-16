require "active_support/time_with_zone"
require "active_support/core_ext/time/calculations"

module Condensation
  module Filters
    module AtMidnight
      def at_midnight(input)
        return if input.nil?

        if input.is_a?(Time)
          value = input
        else
          value = Time.parse(input) rescue nil
        end

        return input unless value.is_a?(Time)
        value.at_midnight
      end

      alias_method :beginning_of_day, :at_midnight
    end
  end
end
