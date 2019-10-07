require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::Money do
  def render_with_filter(template, context = {})
    template.render(context, filters: [Condensation::Filters::Money])
  end

  describe '#cents' do
    it 'should accept a string' do
      template = Liquid::Template.parse("{{ '153' | cents }}")
      result = render_with_filter(template)
      result.must_equal '1.53'
    end

    it 'should accept an integer' do
      template = Liquid::Template.parse('{{ 153 | cents }}')
      result = render_with_filter(template)
      result.must_equal '1.53'
    end

    it 'should accept a varible' do
      template = Liquid::Template.parse('{{ price_in_cents | cents }}')
      result = render_with_filter(template, 'price_in_cents' => 153)
      result.must_equal '1.53'
    end
  end

  describe '#dollars' do
    it 'should accept a string' do
      template = Liquid::Template.parse("{{ '153' | dollars }}")
      result = render_with_filter(template)
      result.must_equal '153.00'
    end

    it 'should accept a formatted currency string' do
      template = Liquid::Template.parse("{{ '$153.00' | dollars }}")
      result = render_with_filter(template)
      result.must_equal '153.00'
    end

    it 'should accept an integer' do
      template = Liquid::Template.parse('{{ 153 | dollars }}')
      result = render_with_filter(template)
      puts result
      result.must_equal '153.00'
    end

    it 'should accept a varible' do
      template = Liquid::Template.parse('{{ price_in_dollars | dollars }}')
      result = render_with_filter(template, 'price_in_dollars' => 153)
      puts result
      result.must_equal '153.00'
    end
  end
end
