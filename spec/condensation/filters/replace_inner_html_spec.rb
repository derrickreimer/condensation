require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::ReplaceInnerHTML do
  def render_with_filter(template, context)
    template.render(context, :filters => [Condensation::Filters::ReplaceInnerHTML])
  end

  describe "#replace_inner_html" do
    it "should replace the inner content of a given HTML tag" do
      tag = "<a href='http://www.example.com'>Foo</a>"
      template = Liquid::Template.parse("{{ example_link | replace_inner_html: 'Bar' }}")
      result = render_with_filter(template, { "example_link" => tag })
      result.must_equal "<a href='http://www.example.com'>Bar</a>"
    end

    it "should not alter malformed input" do
      tags = [
        "< a href='http://www.example.com'>Foo</a>",
        "<a href='http://www.example.com'>Foo< /a>",
        "<a href='http://www.example.com'>Foo",
        " <a href='http://www.example.com'>Foo</a> "
      ]

      tags.each do |tag|
        template = Liquid::Template.parse("{{ example_link | replace_inner_html: 'Bar' }}")
        result = render_with_filter(template, { "example_link" => tag })
        result.must_equal tag
      end
    end
  end
end