require File.dirname(__FILE__) + '/spec_helper.rb'

describe Condensation::Sanitizer do
  describe "#escape_html" do
    it "should escape HTML entities" do
      html = "<div><a href='http://foo.bar/?x=r%20b&y=z'>Baz</a></div>"
      escaped = "&lt;div&gt;&lt;a href='http://foo.bar/?x=r%20b&amp;y=z'&gt;Baz&lt;/a&gt;&lt;/div&gt;"
      Condensation::Sanitizer.new(html).escape_html.must_equal(escaped)
    end
  end
end