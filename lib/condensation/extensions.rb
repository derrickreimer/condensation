require "active_support/time_with_zone"
require "active_support/core_ext/time/calculations"

class ActiveSupport::TimeWithZone
  def to_liquid
    self
  end
end
