# frozen_string_literal: true
# Integer#*
p(6 * 7)
a104 = 6; p(a104 * 7)
a105 = 6; b105 = 7; p(a105 * b105)
a106 = 6; b106 = 7; c106 = (a106 * b106); p c106

# zero
p(6 * 0)
a110 = 6; p(a110 * 0)
a111 = 0; b111 = 9; p(a111 * b111)
a112 = 6; b112 = 0; c112 = (a112 * b112); p c112

# negatives
p((-6) * 7)
p(6 * (-7))
p((-6) * (-7))
a120 = -6; p(a120 * 7)
a121 = -6; b121 = -7; p(a121 * b121)
a122 = -6; b122 = 7; c122 = (a122 * b122); p c122

# large values that fit in int64
p(1000000 * 2000000)
p(3000000000 * 3000000000)
a130 = 3000000000; b130 = 3000000000; c130 = (a130 * b130); p c130

# Float argument
p(3 * 4.5)
a140 = 3; p(a140 * 4.5)
a141 = 3; b141 = 4.5; p(a141 * b141)
a142 = 3; b142 = 4.5; c142 = (a142 * b142); p c142

# Bignum operand (already promoted)
p((2 ** 100) * 3)
p(3 * (2 ** 100))
p((2 ** 100) * (2 ** 100))
a150 = 2 ** 100; p(a150 * 2)
a151 = 2 ** 100; b151 = 2 ** 100; c151 = (a151 * b151); p c151

# WONTFIX: See docs/limitations.md - "By design — Integer overflow"
# p((10 ** 18) * (10 ** 18))

# A user class whose #coerce is reached both explicitly and through the operator.
# The explicit call specialises coerce's parameter, so the operator site aborts
# the C build; kept commented out.
class CoerceMul170
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def coerce(other)
    [CoerceMul170.new(other), self]
  end

  def *(other)
    o = other.is_a?(CoerceMul170) ? other : CoerceMul170.new(other)
    CoerceMul170.new(@value * o.value)
  end
end
p(CoerceMul170.new(3).coerce(4).map(&:value))
v170 = CoerceMul170.new(3).coerce(4).map(&:value); p v170
# specialises #coerce to mrb_int, so this operator site passes it a boxed value
p((2 * CoerceMul170.new(3)).value)
v171 = (2 * CoerceMul170.new(3)).value; p v171

# A user class whose operator is reached ONLY through #coerce, with #coerce
# building its wrapper via a class-method factory.
class CoerceOnlyMul171
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def self.scalar(value)
    new(value)
  end

  def coerce(other)
    [CoerceOnlyMul171.scalar(other), self]
  end

  def *(other)
    o = other.is_a?(CoerceOnlyMul171) ? other : CoerceOnlyMul171.scalar(other)
    CoerceOnlyMul171.new(@value * o.value)
  end
end
p((2 * CoerceOnlyMul171.new(Rational(3, 2))).value)
# coerce-only site ("assigning to 'sp_Rational' from incompatible type 'sp_RbVal'")
v172 = (2 * CoerceOnlyMul171.new(Rational(3, 2))).value; p v172
