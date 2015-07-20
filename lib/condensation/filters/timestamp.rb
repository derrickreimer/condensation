module Condensation
  module Filters
    module Timestamp
      def timestamp(input)
        return if input.respond_to?(:empty?) ? input.empty? : !input
        value = input

        unless value.is_a?(Time)
          begin
            value = Time.parse(input)
          rescue
            raise Liquid::ArgumentError, "cannot convert #{input} to timestamp"
          end
        end

        value.to_i
      end
    end
  end
end
