# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#===
p(Integer === 5)
v006 = (Integer === 5); p v006
p(String === "x")
v007 = (String === "x"); p v007
p(Numeric === 5)
v008 = (Numeric === 5); p v008
p(Integer === "x")
v009 = (Integer === "x"); p v009
p((1..5) === 3)
v010 = ((1..5) === 3); p v010
p((1..5) === 9)
p(:a === :a)
v011 = (:a === :a); p v011
p(/ab/ === "xaby")
p(/z/ === "ab")
even001 = ->(n) { n.even? }; p(even001 === 4)
p(even001 === 3)
p(Comparable === 5)
p(Enumerable === [1])

# the default Object#=== forwards to #==, so a user class's == decides both the
# explicit call and a `when` clause holding one of its instances
class Eq195
  def initialize(v); @v = v; end
  def v; @v; end
  def ==(o); v == o.v; end
end
a195 = Eq195.new(1); b195 = Eq195.new(1); c195 = Eq195.new(2)
p(a195 === b195)
v012 = (a195 === b195); p v012
p(a195 === c195)
v013 = (a195 === c195); p v013
p((case b195 when a195 then "eq" else "ne" end))
v014 = (case b195 when a195 then "eq" else "ne" end); p v014
# the same object still matches itself
p((case a195 when a195 then "same" else "other" end))
