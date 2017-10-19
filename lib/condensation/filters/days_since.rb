require 'time'

module Condensation
  module Filters
    module DaysSince
      SECONDS_PER_DAY = 86_400

      def days_since(input)
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
        [diff.to_i / SECONDS_PER_DAY, 0].max
      end
    end
  end
end
