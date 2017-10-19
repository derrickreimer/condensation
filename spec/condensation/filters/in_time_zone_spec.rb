require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::InTimeZone do
  def render_with_filter(template, context)
    template.render(context, filters: [Condensation::Filters::InTimeZone])
  end

  it 'should handle UTC ISO 8601 dates' do
    created_at = '2015-01-01T10:00:00Z'
    template = Liquid::Template.parse("{{ created_at | in_time_zone: 'America/Los_Angeles' }}")
    result = render_with_filter(template, 'created_at' => created_at)
    result.must_equal '2015-01-01 02:00:00 -0800'

    template = Liquid::Template.parse("{{ created_at | in_time_zone: 'Indian/Maldives' }}")
    result = render_with_filter(template, 'created_at' => created_at)
    result.must_equal '2015-01-01 15:00:00 +0500'
  end

  it 'should handle Time input' do
    created_at = Time.utc(2015, 1, 1, 10, 0, 0)
    template = Liquid::Template.parse("{{ created_at | in_time_zone: 'America/Los_Angeles' }}")
    result = render_with_filter(template, 'created_at' => created_at)
    result.must_equal '2015-01-01 02:00:00 -0800'
  end
end
