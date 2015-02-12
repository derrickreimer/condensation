module Condensation
  module Filters
    module StripCommas
      def strip_commas(input)
        return if input.nil?
        input.gsub(",", "")
      end
    end
  end
end