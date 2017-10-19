require 'openssl'

module Condensation
  module Filters
    module HmacSha256
      def hmac_sha256(input, secret_key)
        return if input.nil?
        OpenSSL::HMAC.hexdigest('SHA256', secret_key, input)
      end
    end
  end
end
