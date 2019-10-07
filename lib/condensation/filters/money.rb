module Condensation
  module Filters
    module Money
      # Strips whitespace and any leading symbol (for currency symbols)
      #
      # All of the following are valid and will be parsed to the same value (100.0)
      #
      #   "$100"
      #   "$100.0"
      #   "CA$ 100.0"
      #   " 100 \n "
      #   "100.00000000000"
      #
      CURRENCY_MATCHER = /^\s*[^\d]*\s*(\d+(?:\.\d+)?)\s*$/.freeze

      def dollars(input)
        if input.is_a?(String)
          input_match = CURRENCY_MATCHER.match(input)
          format('%0.2f', Float(input_match[1])) if input_match
        else
          format('%0.2f', Float(input))
        end
      rescue ArgumentError
        nil
      end

      def cents(input)
        format('%0.2f', Integer(input) / 100.0)
      rescue ArgumentError
        nil
      end
    end
  end
end
