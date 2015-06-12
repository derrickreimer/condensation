require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::AdvanceDateToNext do
  def render_with_filter(template, context)
    template.render(context, :filters => [Condensation::Filters::AdvanceDateToNext])
  end

  it "should handle UTC ISO 8601 dates" do
    created_at = "2015-06-11T10:00:00Z" # a Thursday
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"Saturday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal "2015-06-13T10:00:00Z"
  end

  it "should handle non-UTC ISO 8601 dates" do
    created_at = "2015-06-11T20:00:00-07:00" # a Thursday
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"Saturday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal "2015-06-13T20:00:00-07:00"
  end

  it "should handle YMD formatted dates" do
    created_at = "2015-06-11" # a Thursday
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"Saturday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result[0..18].must_equal "2015-06-13T00:00:00"
  end

  it "should handle Time input" do
    created_at = Time.utc(2015, 6, 11, 10, 0, 0) # a Thursday
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"Saturday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal "2015-06-13T10:00:00Z"
  end

  it "never return the same day" do
    created_at = "2015-06-11T10:00:00Z" # a Thursday
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"Thursday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal "2015-06-18T10:00:00Z"
  end

  it "should handle malformed dates" do
    created_at = "foo"
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"Saturday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal "foo"
  end

  it "should handle empty string input" do
    created_at = ""
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"Saturday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal ""
  end

  it "should handle nil input" do
    created_at = nil
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"Saturday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal ""
  end

  it "should render an error given an invalid day" do
    created_at = "2015-06-11T10:00:00Z" # a Thursday
    template = Liquid::Template.parse("{{ created_at | advance_date_to_next: \"fooday\" }}")
    result = render_with_filter(template, { "created_at" => created_at })
    result.must_equal "Liquid error: fooday is not a valid day"
  end
end
