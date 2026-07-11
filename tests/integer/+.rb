# frozen_string_literal: true
# Integer#+

p(3 + 4)

a001 = 3
p a001.class
p a001 + 4

a002 = 3
b002 = 4
p b002.class
p a002 + b002

a003 = 3
b003 = 4
c003 = (a003 + b003)
p c003.class
p c003

p(-5 + -7)

a011 = -5
p a011.class
p a011 + -7

a012 = -5
b012 = -7
p b012.class
p a012 + b012

a013 = -5
b013 = -7
c013 = (a013 + b013)
p c013.class
p c013

p(0 + 0)

a021 = 0
p a021.class
p a021 + 0

a022 = 0
b022 = 0
p b022.class
p a022 + b022

a023 = 0
b023 = 0
c023 = (a023 + b023)
p c023.class
p c023

p(1000000 + 2000000)

a031 = 1000000
p a031.class
p a031 + 2000000

a032 = 1000000
b032 = 2000000
p b032.class
p a032 + b032

a033 = 1000000
b033 = 2000000
c033 = (a033 + b033)
p c033.class
p c033

p(3 + 4.5)

a041 = 3
p a041.class
p a041 + 4.5

a042 = 3
b042 = 4.5
p b042.class
p a042 + b042

a043 = 3
b043 = 4.5
c043 = (a043 + b043)
p c043.class
p c043

p((2 ** 100) + 1)

a051 = 2 ** 100
p a051 + 1

a052 = 2 ** 100
b052 = 2 ** 100
c052 = (a052 + b052)
p c052

p(5 + (2 ** 100))

# right operand is a user object defining #coerce, while the same operator is
# also called with a direct Integer argument
class CoerceAdd061
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def coerce(other)
    [CoerceAdd061.new(other), self]
  end

  def +(other)
    o = other.is_a?(CoerceAdd061) ? other : CoerceAdd061.new(other)
    CoerceAdd061.new(@value + o.value)
  end
end
p((CoerceAdd061.new(4) + 3).value)
p((3 + CoerceAdd061.new(4)).value)
v061 = (3 + CoerceAdd061.new(4)).value; p v061
