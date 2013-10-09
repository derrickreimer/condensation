module Condensation
  module Filters
    module ReplaceInnerHTML
      def replace_inner_html(input, inner_html = "")
        input.gsub(/\A(<\S.*>)(.*)(<\/\S*>)\z/) do 
          "#{$1}#{inner_html}#{$3}"
        end
      end
    end
  end
end