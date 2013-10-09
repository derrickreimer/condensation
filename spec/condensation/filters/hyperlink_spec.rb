require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe Condensation::Filters::Hyperlink do
  def render_with_filter(template, context)
    template.render(context, :filters => [Condensation::Filters::Hyperlink])
  end

  describe "#hyperlink" do
    it "should use the URL as the anchor text if none provided" do
      url = "http://www.example.com"
      template = Liquid::Template.parse("{{ url | hyperlink }}")
      result = render_with_filter(template, { "url" => url })
      result.must_equal "<a href='#{url}'>#{url}</a>"
    end

    it "should use the provided anchor text" do
      url = "http://www.example.com"
      template = Liquid::Template.parse("{{ url | hyperlink: 'Click here!' }}")
      result = render_with_filter(template, { "url" => url })
      result.must_equal "<a href='#{url}'>Click here!</a>"
    end

    it "should escape HTML in the URL" do
      url = "<script>attack.me()</script>"
      escaped = "&lt;script&gt;attack.me()&lt;/script&gt;"
      template = Liquid::Template.parse("{{ url | hyperlink }}")
      result = render_with_filter(template, { "url" => url })
      result.must_equal "<a href='#{escaped}'>#{escaped}</a>"
    end

    it "should escape HTML in the anchor text" do
      url = "http://www.example.com"
      text = "<script>attack.me()</script>"
      escaped = "&lt;script&gt;attack.me()&lt;/script&gt;"
      template = Liquid::Template.parse("{{ url | hyperlink: '#{text}' }}")
      result = render_with_filter(template, { "url" => url })
      result.must_equal "<a href='#{url}'>#{escaped}</a>"
    end
  end
end