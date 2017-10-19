require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::HmacSha256 do
  def render_with_filter(template, context)
    template.render(context, :filters => [Condensation::Filters::HmacSha256])
  end

  it "should convert a string into a SHA-256 hash using a hash message authentication code" do
    template = Liquid::Template.parse("{{ text | hmac_sha256: 'abcd' }}")

    result = render_with_filter(template, { "text" => "The foo to the bar" })
    result.must_equal "ea8ffbac691e798b71e9604fd8cbd58a55618f5b29bb1dbd781aac769edb2901"
  end

  it "should handle nil values" do
    template = Liquid::Template.parse("{{ text | hmac_sha256: '' }}")

    result = render_with_filter(template, { "text" => nil })
    result.must_equal ""
  end
end
