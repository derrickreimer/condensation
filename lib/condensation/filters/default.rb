module Condensation
  module Filters
    module Default
      def default(input, default_value = '')
        is_blank = input.respond_to?(:empty?) ? input.empty? : !input
        is_blank ? default_value : input
      end
    end
  end
end
