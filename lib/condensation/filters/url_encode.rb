module Condensation
  module Filters
    module UrlEncode
      def url_encode(input)
        CGI.escape(input)
      rescue
        input
      end
    end
  end
end
