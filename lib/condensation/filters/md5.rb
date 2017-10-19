require "digest"

module Condensation
  module Filters
    module MD5
      def md5(input)
        return if input.nil?
        Digest::MD5.hexdigest(input)
      end
    end
  end
end
