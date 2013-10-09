module Condensation
  module Filters
    module Hyperlink
      def hyperlink(input, text = nil)
        input = Condensation::Sanitizer.new(input).escape_html
        text = text ? Condensation::Sanitizer.new(text).escape_html : input
        "<a href='#{input}'>#{text}</a>"
      end
    end
  end
end