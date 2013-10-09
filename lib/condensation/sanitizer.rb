module Condensation
  class Sanitizer
    attr_reader :input

    def initialize(input)
      @input = input
    end

    def escape_html
      CGI.escapeHTML(input) rescue input
    end
  end
end