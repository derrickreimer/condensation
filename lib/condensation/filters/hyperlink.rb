module Condensation
  module Filters
    module Hyperlink
      def hyperlink(input, text = nil)
        return input if input.nil?
        input = Sanitizer.new(input).escape_html
        text = text ? Sanitizer.new(text).escape_html : input
        "<a href='#{input}'>#{text}</a>"
      end
    end
  end
end