module Condensation
  module Filters
    module Money
      def dollars(input)
        format('%0.2f', Float(input))
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
