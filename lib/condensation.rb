require "liquid"
require "condensation/sanitizer"
require "condensation/filters"
require "condensation/version"

module Condensation
  FILTERS = [
    Filters::Default,
    Filters::Hyperlink,
    Filters::ReplaceInnerHTML,
    Filters::DaysSince,
    Filters::DaysUntil
  ]

  def self.register_filters
    FILTERS.each do |filter|
      Liquid::Template.register_filter(filter)
    end
  end
end
