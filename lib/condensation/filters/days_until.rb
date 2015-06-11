require 'time'

module Condensation
  module Filters
    module DaysUntil
      def days_until(input)
        return if input.nil?

        if input.is_a?(Time)
          value = input
        else
          value = Time.parse(input) rescue nil
        end

        return unless value.is_a?(Time)

        diff = value - Time.now
        [diff.to_i / 86400, 0].max
      end
    end
  end
end
