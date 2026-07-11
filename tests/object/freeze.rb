# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#freeze
a050 = "x"; a050.freeze; p a050.frozen?
a051 = [1, 2]; a051.freeze; p a051.frozen?
p("y".freeze.frozen?)
o052 = Obj195.new; o052.freeze; p o052.frozen?
p(Obj195.new.freeze.frozen?)

class Cell195
  def initialize; @v = 1; end
  def v; @v; end
  def v=(x); @v = x; end
end
# freeze returns the receiver itself
o053 = Cell195.new; p o053.freeze.equal?(o053)
# mutating an ivar on a frozen user object raises FrozenError.
# (An attribute assignment needs begin/rescue: the `rescue` modifier binds to the
# right-hand side, so `x.v = 9 rescue e` would let the FrozenError escape.)
o054 = Cell195.new; o054.freeze
r195a = begin; o054.v = 9; "no-raise"; rescue => e195; e195.class; end
p r195a
o055 = Cell195.new; o055.freeze; p o055.v
# an unfrozen sibling still mutates
o056 = Cell195.new; o056.v = 5; p o056.v

class Counter195
  def initialize; @n = 1; end
  def n; @n; end
  def plain; @n = @n + 1; end
  def bump; @n += 1; end
end
# a plain `@n = @n + 1` inside a method raises on a frozen receiver
o057 = Counter195.new.freeze; r195b = (o057.plain rescue $!.class); p r195b
p o057.n
# an op-assign to the same ivar is not checked
o058 = Counter195.new.freeze
r195c = (o058.bump rescue $!.class); p r195c
p o058.n
# freezing is idempotent and dup drops it while clone keeps it
o059 = Counter195.new.freeze; o059.freeze; p o059.frozen?
p Counter195.new.freeze.dup.frozen?
p Counter195.new.freeze.clone.frozen?
v195 = Counter195.new.freeze.clone(freeze: false); p v195.frozen?
