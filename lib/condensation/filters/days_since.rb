require 'quack'

module Condensation
  module Filters
    module DaysSince
      def days_since(input)
        return if input.nil?
        value = Quack(input).to_coerced
        return unless value.is_a?(Time)

        diff = Time.now - value
        [diff.to_i / 86400, 0].max
      end
    end
  end
end