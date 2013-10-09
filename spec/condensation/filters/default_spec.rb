require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::Default do
  def render_with_filter(template, context)
    template.render(context, :filters => [Condensation::Filters::Default])
  end

  describe "#default" do
    it "should return input if it is not blank" do
      template = Liquid::Template.parse("{{ name | default: 'Bar' }}")
      result = render_with_filter(template, { "name" => "Foo" })
      result.must_equal "Foo"
    end

    it "should return default value if input is nil" do
      template = Liquid::Template.parse("{{ name | default: 'Bar' }}")
      result = render_with_filter(template, { "name" => nil })
      result.must_equal "Bar"
    end

    it "should return default value if input is an empty string" do
      template = Liquid::Template.parse("{{ name | default: 'Bar' }}")
      result = render_with_filter(template, { "name" => "" })
      result.must_equal "Bar"
    end

    it "should return default value if input is an empty hash" do
      template = Liquid::Template.parse("{{ name | default: 'Bar' }}")
      result = render_with_filter(template, { "name" => {} })
      result.must_equal "Bar"
    end

    it "should return default value if input is an empty array" do
      template = Liquid::Template.parse("{{ name | default: 'Bar' }}")
      result = render_with_filter(template, { "name" => [] })
      result.must_equal "Bar"
    end

    it "should return default value if input is false" do
      template = Liquid::Template.parse("{{ name | default: 'Bar' }}")
      result = render_with_filter(template, { "name" => false })
      result.must_equal "Bar"
    end
  end
end