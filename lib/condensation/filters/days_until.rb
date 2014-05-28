require 'quack'

module Condensation
  module Filters
    module DaysUntil
      def days_until(input)
        return if input.nil?
        value = Quack(input).to_coerced
        return unless value.is_a?(Time)

        diff = value - Time.now
        [diff.to_i / 86400, 0].max
      end
    end
  end
end