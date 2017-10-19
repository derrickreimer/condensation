module Condensation
  module Filters
    module StripCommas
      def strip_commas(input)
        return if input.nil?
        input.delete(',')
      end
    end
  end
end
