require 'active_support/time_with_zone'
require 'active_support/core_ext/time/calculations'

module Condensation
  module Filters
    module AdvanceDateToNext
      def advance_date_to_next(input, day)
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

        days = %w[sunday monday tuesday wednesday thursday friday saturday]
        day_number = days.index(day.downcase)

        unless day_number
          raise Liquid::ArgumentError, "#{day} is not a valid day"
        end

        loop do
          value += 86_400 # advance a day
          break if value.wday == day_number
        end

        value
      end
    end
  end
end
