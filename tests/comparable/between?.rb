# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

a = Ver.new(5); b = Ver.new(9)

# Comparable#between?
p(Ver.new(5).between?(Ver.new(1), Ver.new(9)))

a001 = Ver.new(5)
p a001.class
p(a001.between?(Ver.new(1), Ver.new(9)))

a002 = Ver.new(5)
lo002 = Ver.new(1)
hi002 = Ver.new(9)
p lo002.class
p(a002.between?(lo002, hi002))

a003 = Ver.new(5)
lo003 = Ver.new(1)
hi003 = Ver.new(9)
c003 = a003.between?(lo003, hi003)
p c003.class
p c003

p(Ver.new(12).between?(Ver.new(1), Ver.new(9)))

a001 = Ver.new(12)
p a001.class
p(a001.between?(Ver.new(1), Ver.new(9)))

a002 = Ver.new(12)
lo002 = Ver.new(1)
hi002 = Ver.new(9)
p lo002.class
p(a002.between?(lo002, hi002))

a003 = Ver.new(12)
lo003 = Ver.new(1)
hi003 = Ver.new(9)
c003 = a003.between?(lo003, hi003)
p c003.class
p c003

p(Ver.new(1).between?(Ver.new(1), Ver.new(9)))

a001 = Ver.new(1)
p a001.class
p(a001.between?(Ver.new(1), Ver.new(9)))

# Comparable#between? with a <=> that returns nil for an incomparable arg (mixed-type)
class VerN
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); return nil unless o.is_a?(VerN); n <=> o.n; end
end
an237 = VerN.new(5)
r242 = (an237.between?(1, 9) rescue $!.class); p r242
c242 = (an237.between?(1, 9) rescue $!.class); p c242

# Comparable#between? with an arbitrary-magnitude Integer <=> result, and a Float <=> result
class Diff
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); @n - o.n; end
end
p(Diff.new(5).between?(Diff.new(1), Diff.new(9)))
p(Diff.new(12).between?(Diff.new(1), Diff.new(9)))
d310 = Diff.new(5); lo310 = Diff.new(1); hi310 = Diff.new(9); e310 = d310.between?(lo310, hi310); p e310
class FDiff
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); (@n - o.n).to_f; end
end
p(FDiff.new(5).between?(FDiff.new(1), FDiff.new(9)))
p(FDiff.new(12).between?(FDiff.new(1), FDiff.new(9)))

# between? with reversed bounds (lo>hi) -> always false, never raises
p(Diff.new(5).between?(Diff.new(9), Diff.new(1)))

# Comparable#between? with a non-Integer, non-nil <=> result -> Ruby raises ArgumentError
class Bad
  include Comparable
  def <=>(o); "x"; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# g311 = (Bad.new.between?(Bad.new, Bad.new) rescue $!.class); p g311

# between? where the receiver is comparable to lo but <=> returns nil for hi -> ArgumentError
class VerP
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); return nil unless o.is_a?(VerP); n <=> o.n; end
end
r312 = (VerP.new(5).between?(VerP.new(1), 99) rescue $!.class); p r312

# a class defining <=> but NOT including Comparable still compares in Spinel (permissive);
# CRuby raises NoMethodError. Documented limitation, not a bug.
# WONTFIX: See docs/limitations.md - "By design — Comparable is keyed on <=> presence"

# Comparable#between? with a <=> returning a non-numeric, non-nil object (Array): CRuby
# raises NoMethodError; Spinel coerces the junk result and returns false.
class ArrCmp
  include Comparable
  def <=>(o); [1]; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# n321 = (ArrCmp.new.between?(ArrCmp.new, ArrCmp.new) rescue $!.class); p n321

class Money322
  include Comparable
  attr_reader :cents
  def initialize(c); @cents = c; end
  def <=>(o); cents <=> o.cents; end
end
list322 = [Money322.new(500), Money322.new(200)]
r322 = (list322.select { |m| m.between?(Money322.new(100), Money322.new(900)) }.map(&:cents) rescue $!.class); p r322

# Comparable#between? on a receiver bound to a block parameter, and on a subclass
class SubVer401 < Ver; end
p([Ver.new(3), Ver.new(1)].map { |v401| v401.between?(Ver.new(1), Ver.new(2)) })
c402 = [Ver.new(3), Ver.new(1)].map { |v402| v402.between?(Ver.new(1), Ver.new(2)) }; p c402
p(SubVer401.new(2).between?(Ver.new(1), Ver.new(5)))
c403 = SubVer401.new(2).between?(Ver.new(1), Ver.new(5)); p c403
