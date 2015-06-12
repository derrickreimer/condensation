require "active_support/time_with_zone"
require "active_support/core_ext/time/calculations"

module Condensation
  module Filters
    module AdvanceDateToNext
      def advance_date_to_next(input, day)
        return if input.nil?

        if input.is_a?(Time)
          value = input
        else
          value = Time.parse(input) rescue nil
        end

        return input unless value.is_a?(Time)

        days = %w{sunday monday tuesday wednesday thursday friday saturday}
        day_number = days.index(day.downcase)

        unless day_number
          raise Liquid::ArgumentError, "#{day} is not a valid day"
        end

        loop do
          value = value + 86400  # advance a day
          break if value.wday == day_number
        end

        value.iso8601
      end
    end
  end
end
