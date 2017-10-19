require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::MD5 do
  def render_with_filter(template, context)
    template.render(context, :filters => [Condensation::Filters::MD5])
  end

  it "should return a MD5 hash of the input" do
    template = Liquid::Template.parse("{{ text | md5 }}")

    result = render_with_filter(template, { "text" => "The foo to the bar"})
    result.must_equal "9dd755a53b119d3e8d7106aafe7d9d44"
  end

  it "should handle nil values" do
    template = Liquid::Template.parse("{{ text | md5 }}")

    result = render_with_filter(template, { "text" => nil })
    result.must_equal ""
  end
end
