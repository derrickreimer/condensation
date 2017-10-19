require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::UrlEncode do
  def render_with_filter(template, context)
    template.render(context, filters: [Condensation::Filters::UrlEncode])
  end

  it 'encode the input' do
    email = 'derrick+1@example.com'
    template = Liquid::Template.parse('{{ email | url_encode }}')
    result = render_with_filter(template, 'email' => email)
    result.must_equal 'derrick%2B1%40example.com'
  end

  it 'should handle nil values' do
    email = nil
    template = Liquid::Template.parse('{{ email | url_encode }}')
    result = render_with_filter(template, 'email' => email)
    result.must_equal ''
  end
end
