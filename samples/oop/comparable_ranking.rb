# frozen_string_literal: true
# A custom Comparable value used across sort, min/max, clamp, between?, and as a
# Hash key / in a Set. Inference: Comparable dispatch and identity from containers.

require "set"

class Version
  include Comparable
  attr_reader :parts
  def initialize(str)
    @parts = str.split(".").map(&:to_i)
  end
  def <=>(other) = parts <=> other.parts
  def to_s = parts.join(".")
  def hash = parts.hash
  def eql?(other) = other.is_a?(Version) && parts == other.parts
end

vs = ["1.2.0", "1.10.0", "1.2.3", "0.9.9", "2.0.0"].map { |s| Version.new(s) }

puts vs.sort.map(&:to_s).join(", ")
puts vs.max.to_s
puts vs.min.to_s

p Version.new("1.5.0").between?(Version.new("1.0.0"), Version.new("2.0.0"))
puts Version.new("3.0.0").clamp(Version.new("1.0.0"), Version.new("2.0.0")).to_s

# as a Hash key.
releases = { Version.new("1.2.0") => "stable", Version.new("2.0.0") => "beta" }
p releases[Version.new("1.2.0")]
p releases[Version.new("9.9.9")]

# in a Set.
seen = Set.new
seen << Version.new("1.2.0")
seen << Version.new("1.2.0")
p seen.size
p seen.include?(Version.new("1.2.0"))

# sorted then read back and re-compared.
sorted = vs.sort
p sorted.first < sorted.last
p sorted.each_cons(2).all? { |a, b| a <= b }
p vs.minmax.map(&:to_s)
