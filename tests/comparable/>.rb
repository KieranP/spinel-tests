# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#>

p(Ver.new(9) > Ver.new(5))

a001 = Ver.new(9)
p a001.class
p a001 > Ver.new(5)

a002 = Ver.new(9)
b002 = Ver.new(5)
p b002.class
p a002 > b002

a003 = Ver.new(9)
b003 = Ver.new(5)
c003 = a003 > b003
p c003.class
p c003

p(Ver.new(5) > Ver.new(9))

a004 = Ver.new(5)
p a004.class
p a004 > Ver.new(9)

a005 = Ver.new(5)
b005 = Ver.new(9)
p b005.class
p a005 > b005

a006 = Ver.new(5)
b006 = Ver.new(9)
c006 = a006 > b006
p c006.class
p c006

p(Ver.new(5) > Ver.new(5))

a007 = Ver.new(5)
p a007.class
p a007 > Ver.new(5)

a008 = Ver.new(5)
b008 = Ver.new(5)
p b008.class
p a008 > b008

a009 = Ver.new(5)
b009 = Ver.new(5)
c009 = a009 > b009
p c009.class
p c009

# Comparable#> with a <=> that returns nil for an incomparable arg (mixed-type)
class VerN
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); return nil unless o.is_a?(VerN); n <=> o.n; end
end
an237 = VerN.new(5)
r237 = (an237 > 3 rescue $!.class)
p r237

# Comparable#> with an arbitrary-magnitude Integer <=> result (Ruby uses only the sign)
class Diff
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); @n - o.n; end
end
p(Diff.new(9) > Diff.new(5))
d310 = Diff.new(9)
p(d310 > Diff.new(5))
d311 = Diff.new(9); e311 = Diff.new(5); f311 = (d311 > e311); p f311

# Comparable#> with a Float <=> result (Ruby uses only the sign)
class FDiff
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); (@n - o.n).to_f; end
end
p(FDiff.new(9) > FDiff.new(5))
g312 = FDiff.new(5); h312 = FDiff.new(9); i312 = (g312 > h312); p i312

# Comparable#> with a non-Integer, non-nil <=> result -> Ruby raises ArgumentError
class Bad
  include Comparable
  def <=>(o); "x"; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# j313 = (Bad.new > Bad.new rescue $!.class); p j313

# Comparable#> with a <=> returning a non-numeric, non-nil object (Array): CRuby raises
# NoMethodError; Spinel coerces the junk result to a comparison outcome.
class ArrCmp
  include Comparable
  def <=>(o); [1]; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# n317 = (ArrCmp.new > ArrCmp.new rescue $!.class); p n317

# reflexive self-comparison: the receiver IS the argument (same object)
sx317 = Ver.new(7); p(sx317 > sx317)
sy317 = Ver.new(7); wsy317 = (sy317 > sy317); p wsy317

# Comparable#> reached through a module that itself includes Comparable
module Sizeable401
  include Comparable
  def <=>(o); sv <=> o.sv; end
end
class Box401
  include Sizeable401
  attr_reader :sv
  def initialize(n); @sv = n; end
end
p(Box401.new(3) > Box401.new(1))
a401 = Box401.new(3); b401 = Box401.new(1); c401 = (a401 > b401); p c401

# Comparable#> on a subclass that inherits <=>
class SubVer402 < Ver; end
p(SubVer402.new(3) > Ver.new(1))
a402 = SubVer402.new(1); b402 = Ver.new(3); c402 = (a402 > b402); p c402

# Comparable#> on a receiver bound to a block parameter
p([Ver.new(3), Ver.new(1)].map { |v403| v403 > Ver.new(2) })
c404 = [Ver.new(3), Ver.new(1)].select { |v404| v404 > Ver.new(2) }.map(&:n); p c404
