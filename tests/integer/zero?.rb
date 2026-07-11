# frozen_string_literal: true
# Integer#zero?
p(0.zero?)
a102 = 0; p(a102.zero?)
a103 = 0; c103 = (a103.zero?); p c103

p(5.zero?)
p((-5).zero?)
a104 = 5; c104 = (a104.zero?); p c104

# Bignum receiver:
p((2 ** 100).zero?)
a105 = 2 ** 100; c105 = (a105.zero?); p c105

# forwarded from a same-named user predicate whose receiver is an Integer|Rational union
class ZeroFwd106
  def initialize(v)
    @value = v
  end

  def zero?
    @value.zero?
  end
end
p(ZeroFwd106.new(0).zero?)
c106 = ZeroFwd106.new(Rational(0)).zero?; p c106
p(ZeroFwd106.new(7).zero?)

# the same body under a name that does not collide with the built-in is correct on
# its own, but is dragged down program-wide by ZeroFwd106 above
class ZeroFwd107
  def initialize(v)
    @value = v
  end

  def is_zero
    @value.zero?
  end
end
p(ZeroFwd107.new(0).is_zero)
c107 = ZeroFwd107.new(Rational(1, 2)).is_zero; p c107
