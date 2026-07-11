# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

a = Ver.new(5); b = Ver.new(9)

# Comparable#>=
p(Ver.new(9) >= Ver.new(5))

a001 = Ver.new(9)
p a001.class
p(a001 >= Ver.new(5))

a002 = Ver.new(9)
b002 = Ver.new(5)
p b002.class
p(a002 >= b002)

a003 = Ver.new(9)
b003 = Ver.new(5)
c003 = (a003 >= b003)
p c003.class
p c003

p(Ver.new(5) >= Ver.new(9))

a001 = Ver.new(5)
p a001.class
p(a001 >= Ver.new(9))

a002 = Ver.new(5)
b002 = Ver.new(9)
p b002.class
p(a002 >= b002)

a003 = Ver.new(5)
b003 = Ver.new(9)
c003 = (a003 >= b003)
p c003.class
p c003

p(Ver.new(5) >= Ver.new(5))

a001 = Ver.new(5)
p a001.class
p(a001 >= Ver.new(5))

a002 = Ver.new(5)
b002 = Ver.new(5)
p b002.class
p(a002 >= b002)

a003 = Ver.new(5)
b003 = Ver.new(5)
c003 = (a003 >= b003)
p c003.class
p c003

# Comparable#>= with a <=> that returns nil for an incomparable arg (mixed-type)
class VerN
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); return nil unless o.is_a?(VerN); n <=> o.n; end
end
an237 = VerN.new(5)
r237 = (an237 >= 3 rescue $!.class); p r237
c240 = (an237 >= 3 rescue $!.class); p c240

# Comparable#>= with an arbitrary-magnitude Integer <=> result (Ruby uses only the sign)
class Diff
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); @n - o.n; end
end
p(Diff.new(9) >= Diff.new(5))
d310 = Diff.new(9)
p(d310 >= Diff.new(5))
d311 = Diff.new(9); e311 = Diff.new(5); f311 = (d311 >= e311); p f311

# Comparable#>= with a Float <=> result (Ruby uses only the sign)
class FDiff
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); (@n - o.n).to_f; end
end
p(FDiff.new(9) >= FDiff.new(5))
g312 = FDiff.new(5); h312 = FDiff.new(9); i312 = (g312 >= h312); p i312

# Comparable#>= with a non-Integer, non-nil <=> result -> Ruby raises ArgumentError
class Bad
  include Comparable
  def <=>(o); "x"; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# j313 = (Bad.new >= Bad.new rescue $!.class); p j313

# Comparable#>= with a <=> returning a non-numeric, non-nil object (Array): CRuby raises
# NoMethodError; Spinel coerces the junk result to a comparison outcome.
class ArrCmp
  include Comparable
  def <=>(o); [1]; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# n318 = (ArrCmp.new >= ArrCmp.new rescue $!.class); p n318

# reflexive self-comparison: the receiver IS the argument (same object)
sx318 = Ver.new(7); p(sx318 >= sx318)
sy318 = Ver.new(7); wsy318 = (sy318 >= sy318); p wsy318
