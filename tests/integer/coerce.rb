# frozen_string_literal: true
# Integer#coerce
p(1.coerce(2.5))
a037 = 1; p(a037.coerce(2.5))
a038 = 1; b038 = 2.5; p(a038.coerce(b038))
a039 = 1; b039 = 2.5; c039 = (a039.coerce(b039)); p c039

# Integer arg → [Integer, Integer]
p(1.coerce(2))
co01 = 1; co01b = 2; cco01 = (co01.coerce(co01b)); p cco01
# element classes
p(1.coerce(2.5).map(&:class))
p(1.coerce(2).map(&:class))
# Bignum arg
p(1.coerce(2 ** 100))
co02 = 1; co02b = 2 ** 100; cco02 = (co02.coerce(co02b)); p cco02

p(5.coerce(2r))
co03 = 5; co03b = 2r; cco03 = (co03.coerce(co03b)); p cco03
# Float receiver-side pair (Integer receiver, Float arg -> [Float, Float])
p(3.coerce(1.5))
co04 = 3; co04b = 1.5; cco04 = (co04.coerce(co04b)); p cco04

# coerce on a Bignum RECEIVER (Ruby: [5, 2**100]) works.
p((2 ** 100).coerce(5))
co05 = 2 ** 100; co05b = 5; cco05 = (co05.coerce(co05b)); p cco05

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ie(oie)
  case oie
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_ie = (raisebr_ie("ab").coerce(2) rescue $!.class); p rb_ie
# (CoF170 below), Integer#coerce with a String argument emits a String push into an
# sp_int array. Kept commented: the C build aborts and takes the whole file down.
r880 = (5.coerce("x") rescue $!.class); p r880

# Integer#coerce with a nil argument (Ruby raises TypeError)
r881 = (5.coerce(nil) rescue $!.class); p r881

# Kept last: Integer#coerce with a Complex argument raises (Complex#to_f RangeError) under both, so it would suppress
# every line after it.
p(5.coerce(Complex(1, 2)))
# The Integer + user-object coercion CoF170 was filed for now works.
class CoF170
  attr_reader :n
  def self.from(value) = value.is_a?(CoF170) ? value : new(value)
  def initialize(n) = @n = n
  def +(other) = CoF170.new(@n + CoF170.from(other).n)
  def coerce(other) = [CoF170.from(other), self]
  def to_s = @n.to_s
end
r170 = (begin; (5 + CoF170.from(3)).to_s; rescue TypeError => e170; e170.class; end); p r170
v171 = (begin; (5 + CoF170.from(3)).to_s; rescue TypeError => e171; e171.class; end); p v171
