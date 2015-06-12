require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::StripCommas do
  def render_with_filter(template, context)
    template.render(context, :filters => [Condensation::Filters::StripCommas])
  end

  it "remove commas" do
    tag = "foo, bar, bop"
    template = Liquid::Template.parse("{{ tag | strip_commas }}")
    result = render_with_filter(template, { "tag" => tag })
    result.must_equal "foo bar bop"
  end

  it "should handle nil values" do
    tag = nil
    template = Liquid::Template.parse("{{ tags | strip_commas }}")
    result = render_with_filter(template, { "tag" => tag })
    result.must_equal ""
  end
end
