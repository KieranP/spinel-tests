# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

a = Ver.new(5); b = Ver.new(9)

# Comparable#clamp (2-arg form works; Range form breaks compilation)
p(Ver.new(5).clamp(Ver.new(1), Ver.new(9)).n)

a001 = Ver.new(5)
p a001.class
p(a001.clamp(Ver.new(1), Ver.new(9)).n)

a002 = Ver.new(5)
lo002 = Ver.new(1)
hi002 = Ver.new(9)
p lo002.class
p(a002.clamp(lo002, hi002).n)

a003 = Ver.new(5)
lo003 = Ver.new(1)
hi003 = Ver.new(9)
c003 = a003.clamp(lo003, hi003).n
p c003.class
p c003

p(Ver.new(0).clamp(Ver.new(1), Ver.new(9)).n)

a004 = Ver.new(0)
p a004.class
p(a004.clamp(Ver.new(1), Ver.new(9)).n)

p(Ver.new(12).clamp(Ver.new(1), Ver.new(9)).n)

a005 = Ver.new(12)
p a005.class
p(a005.clamp(Ver.new(1), Ver.new(9)).n)

# Comparable#clamp with a Range receiver
lo = Ver.new(1); hi = Ver.new(9); p(Ver.new(5).clamp(lo..hi).n)
lo2 = Ver.new(1); hi2 = Ver.new(9); c009 = Ver.new(5).clamp(lo2..hi2).n; p c009

# Integer#clamp with a Range
p(5.clamp(1..10))
c011 = 5.clamp(1..10); p(c011)
rv140 = (1..10); p(15.clamp(rv140))
rv141 = (1..10); r140 = 15.clamp(rv141); p r140
p(0.clamp(1..10))

# Integer#clamp(lo, hi)
p(5.clamp(1, 10))
c012 = 15.clamp(1, 10); p c012

# Float#clamp
p(5.5.clamp(1.0, 10.0))
c013 = 12.5.clamp(1.0, 10.0); p c013

# Comparable#clamp(lo, hi) with a <=> that returns nil for an incomparable arg (mixed-type)
class VerN
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); return nil unless o.is_a?(VerN); n <=> o.n; end
end
an237 = VerN.new(5)
r241 = (an237.clamp(1, 9) rescue $!.class); p r241
c241 = (an237.clamp(1, 9) rescue $!.class); p c241

# Comparable#clamp(lo, hi) with an arbitrary-magnitude Integer <=> result
class Diff
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); @n - o.n; end
end
p(Diff.new(12).clamp(Diff.new(1), Diff.new(9)).n)
p(Diff.new(0).clamp(Diff.new(1), Diff.new(9)).n)
dlo310 = Diff.new(1); dhi310 = Diff.new(9); d310 = Diff.new(5).clamp(dlo310, dhi310).n; p d310

# clamp returns the receiver/bound object itself (identity preserved)
v310 = Ver.new(5); vlo310 = Ver.new(1); vhi310 = Ver.new(9)
p(v310.clamp(vlo310, vhi310).equal?(v310))
p(Ver.new(12).clamp(vlo310, vhi310).equal?(vhi310))

# Integer one-sided (beginless/endless) clamp
p(15.clamp(..10)); p(15.clamp(1..)); p(0.clamp(1..)); p(5.clamp(..10))
r311 = 15.clamp(..10); p r311
r312 = 0.clamp(1..); p r312

# clamp with an EXCLUSIVE range, and with reversed bounds (lo>hi) -> ArgumentError
r313 = (5.clamp(1...10) rescue $!.class); p r313
r314 = (5.clamp(10, 1) rescue $!.class); p r314

# Comparable#clamp with a one-sided Range of a user Comparable object (folds bounds, no Range built)
p(Ver.new(12).clamp(..Ver.new(9)).n)
co315 = Ver.new(0).clamp(Ver.new(1)..).n; p co315

# Comparable#clamp with a Float <=> result -> Ruby uses the sign; Spinel wrongly raises
class FDiff
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); (@n - o.n).to_f; end
end
r316 = (FDiff.new(12).clamp(FDiff.new(1), FDiff.new(9)).n rescue $!.class); p r316

# clamp where lo == hi collapses to that single value; clamp preserves the receiver class
p(Ver.new(5).clamp(Ver.new(3), Ver.new(3)).n)
p(Ver.new(12).clamp(Ver.new(1), Ver.new(9)).class)
rc317 = Ver.new(5).clamp(Ver.new(3), Ver.new(3)).n; p rc317

# A two-sided Range of user objects STORED IN A VARIABLE builds a Range object, which has
# nowhere to hold user-object bounds (unboxed mrb_int); Spinel rejects it cleanly at compile
# time, naming the class. The inline and one-sided forms above need no Range and do work.
# WONTFIX: See docs/limitations.md - "By design — A Range object needs Integer/Float/String bounds"
# rng318 = (Ver.new(1)..Ver.new(9)); p(Ver.new(12).clamp(rng318).n)

# clamp with an EXCLUSIVE Range of user objects should raise ArgumentError (as it
# does for an Integer receiver); Spinel returns a value instead.
rex319 = (Ver.new(5).clamp(Ver.new(1)...Ver.new(9)).n rescue $!.class); p rex319

# clamp with a nil bound (Ruby 2.7+: nil = open bound). nil LOWER bound works;
# a user Comparable object handles both nil bounds correctly.
p(12.clamp(nil, 9)); p(0.clamp(nil, 9))
p(Ver.new(12).clamp(nil, Ver.new(9)).n); p(Ver.new(0).clamp(Ver.new(1), nil).n)
rnu320 = (5.clamp(1, nil) rescue $!.class); p rnu320
p(5.clamp(nil, nil))

# Comparable#clamp with a <=> returning a non-numeric, non-nil object (Array): CRuby raises
# NoMethodError; Spinel raises ArgumentError (wrong class; the operator forms wrongly return a value).
class ArrCmp
  include Comparable
  def <=>(o); [1]; end
end
# WONTFIX: See docs/limitations.md - "By design — Comparable with a non-conforming #<=>"
# n322 = (ArrCmp.new.clamp(ArrCmp.new, ArrCmp.new) rescue $!.class); p n322

# Comparable#clamp on a receiver bound to a block parameter, and reached through a module
p([Ver.new(3), Ver.new(1)].map { |v401| v401.clamp(Ver.new(2), Ver.new(4)).n })
c402 = [Ver.new(3), Ver.new(1)].map { |v402| v402.clamp(Ver.new(2), Ver.new(4)).n }; p c402
module Sizeable403
  include Comparable
  def <=>(o); sv <=> o.sv; end
end
class Box403
  include Sizeable403
  attr_reader :sv
  def initialize(n); @sv = n; end
end
p(Box403.new(2).clamp(Box403.new(3), Box403.new(9)).sv)
c404 = Box403.new(2).clamp(Box403.new(3), Box403.new(9)).sv; p c404
