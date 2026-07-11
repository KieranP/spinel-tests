# frozen_string_literal: true
# Semantic-version value object mixing in Comparable via <=>.
# Inference: a user class whose only order operator is <=> must still resolve
# sort / min / max / between? / clamp — the Comparable mixin, dispatched on a
# user receiver, is a known weak surface.

class Version
  include Comparable
  attr_reader :major, :minor, :patch

  def initialize(str)
    parts = str.split(".").map(&:to_i)
    @major = parts[0]
    @minor = parts[1]
    @patch = parts[2]
  end

  def <=>(other)
    [major, minor, patch] <=> [other.major, other.minor, other.patch]
  end

  def to_s = "#{major}.#{minor}.#{patch}"
end

versions = ["1.2.0", "1.10.3", "1.2.10", "2.0.0", "1.2.0"].map { |s| Version.new(s) }

puts versions.sort.map(&:to_s)
puts versions.min.to_s
puts versions.max.to_s
p Version.new("1.2.0") == Version.new("1.2.0")
p Version.new("1.2.0") < Version.new("1.10.0")
p Version.new("1.5.0").between?(Version.new("1.0.0"), Version.new("2.0.0"))
puts Version.new("3.0.0").clamp(Version.new("1.0.0"), Version.new("2.0.0")).to_s
