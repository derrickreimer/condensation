require 'time'

module Condensation
  module Filters
    module WeeksSince
      SECONDS_PER_WEEK = 86_400 * 7

      def weeks_since(input)
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

        return unless value.is_a?(Time)

        diff = Time.now - value
        [diff.to_i / SECONDS_PER_WEEK, 0].max
      end
    end
  end
end
