require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::Timestamp do
  def render_with_filter(template, context)
    template.render(context, :filters => [Condensation::Filters::Timestamp])
  end

  it "should handle UTC ISO 8601 dates" do
    created_at = "2015-06-11T10:00:00Z" # a Thursday
    template = Liquid::Template.parse("{{ created_at | timestamp }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal Time.parse(created_at).to_i.to_s
  end

  it "should handle non-UTC ISO 8601 dates" do
    created_at = "2015-06-11T20:00:00-07:00" # a Thursday
    template = Liquid::Template.parse("{{ created_at | timestamp }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal Time.parse(created_at).to_i.to_s
  end

  it "should handle YMD formatted dates" do
    created_at = "2015-06-11" # a Thursday
    template = Liquid::Template.parse("{{ created_at | timestamp }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal Time.parse(created_at).to_i.to_s
  end

  it "should handle UTC Time input" do
    created_at = Time.utc(2015, 6, 11, 10, 0, 0) # a Thursday
    template = Liquid::Template.parse("{{ created_at | timestamp }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal created_at.to_i.to_s
  end

  it "should handle non-UTC ActiveSupport::TimeWithZone input" do
    zone = ActiveSupport::TimeZone["Indian/Maldives"] # UTC+05:00
    created_at = Time.utc(2015, 6, 11, 10, 0, 0).in_time_zone(zone) # Thu, 11 Jun 2015 15:00:00 MVT +05:00
    template = Liquid::Template.parse("{{ created_at | timestamp }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal created_at.to_i.to_s
  end

  it "should render an error given an invalid date" do
    created_at = "foo"
    template = Liquid::Template.parse("{{ created_at | timestamp }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal "Liquid error: cannot convert foo to timestamp"
  end

  it "should handle empty string input" do
    created_at = ""
    template = Liquid::Template.parse("{{ created_at | timestamp }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal ""
  end

  it "should handle nil input" do
    created_at = nil
    template = Liquid::Template.parse("{{ created_at | timestamp }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal ""
  end
end
