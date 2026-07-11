# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

# Comparable#!=

p(Ver.new(5) != Ver.new(9))

a001 = Ver.new(5)
p a001.class
p a001 != Ver.new(9)

a002 = Ver.new(5)
b002 = Ver.new(9)
p b002.class
p a002 != b002

a003 = Ver.new(5)
b003 = Ver.new(9)
c003 = a003 != b003
p c003.class
p c003

p(Ver.new(5) != Ver.new(5))

a004 = Ver.new(5)
p a004.class
p a004 != Ver.new(5)

a005 = Ver.new(5)
b005 = Ver.new(5)
p b005.class
p a005 != b005

a006 = Ver.new(5)
b006 = Ver.new(5)
c006 = a006 != b006
p c006.class
p c006

# Comparable#!= with a <=> that returns nil for an incomparable arg -> true (never raises)
class VerN
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); return nil unless o.is_a?(VerN); n <=> o.n; end
end
p(VerN.new(5) != 3)
a310 = VerN.new(5); p(a310 != 3)
c311 = (VerN.new(5) != 3); p c311

# Comparable#!= with a non-Integer, non-nil <=> result -> Ruby raises ArgumentError
class Bad
  include Comparable
  def <=>(o); "x"; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# g312 = (Bad.new != Bad.new rescue $!.class); p g312

# Comparable#!= with a <=> returning a non-numeric, non-nil object (Array): CRuby raises
# NoMethodError; Spinel coerces the junk result to a comparison outcome.
class ArrCmp
  include Comparable
  def <=>(o); [1]; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# n320 = (ArrCmp.new != ArrCmp.new rescue $!.class); p n320
