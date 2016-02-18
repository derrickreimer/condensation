require 'time'

module Condensation
  module Filters
    module WeeksUntil
      SECONDS_PER_WEEK = 86400 * 7

      def weeks_until(input)
        return if input.nil?

        if input.is_a?(Time)
          value = input
        else
          value = Time.parse(input) rescue nil
        end

        return unless value.is_a?(Time)

        diff = value - Time.now
        [diff.to_i / SECONDS_PER_WEEK, 0].max
      end
    end
  end
end
