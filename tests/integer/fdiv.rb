# frozen_string_literal: true
# Integer#fdiv
p(7.fdiv(2))
a049 = 7; p(a049.fdiv(2))
a050 = 7; b050 = 2; p(a050.fdiv(b050))
a051 = 7; b051 = 2; c051 = (a051.fdiv(b051)); p c051

# Integer#fdiv negative operands
p((-7).fdiv(2))
p(7.fdiv(-2))
p((-7).fdiv(-2))
a100 = -7; b100 = 2; c100 = (a100.fdiv(b100)); p c100

# Integer#fdiv zero dividend and division by zero (Float Infinity/NaN, no error)
p(0.fdiv(5))
p(7.fdiv(0))
p((-7).fdiv(0))
p(0.fdiv(0))
a101 = 7; b101 = 0; c101 = (a101.fdiv(b101)); p c101

# Integer#fdiv with a Float argument
p(7.fdiv(2.5))
p(7.fdiv(2.5).class)
a102 = 7; b102 = 2.5; c102 = (a102.fdiv(b102)); p c102

# Integer#fdiv with a Bignum receiver
p((2 ** 70).fdiv(3))
a103 = 2 ** 70; b103 = 3; c103 = (a103.fdiv(b103)); p c103
# Bignum receiver, negative divisor
p((2 ** 70).fdiv(-3))
a105 = 2 ** 70; b105 = -3; c105 = (a105.fdiv(b105)); p c105

# Integer#fdiv with a Rational argument (coerces via #to_f)
p(7.fdiv(2r))
a104 = 7; b104 = 2r; c104 = (a104.fdiv(b104)); p c104

r104x = (7.fdiv(Complex(1, 2)) rescue $!.class); p r104x

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_if(oif)
  case oif
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_if = (raisebr_if("ab").fdiv(3) rescue $!.class); p rb_if
r880 = (5.fdiv("x") rescue $!.class); p r880

# Integer#fdiv with a nil argument (Ruby raises TypeError)
r881 = (5.fdiv(nil) rescue $!.class); p r881

# Kept last: Integer#fdiv with a Complex argument raises (Complex#to_f RangeError) under both, so it would suppress
# every line after it.
p(7.fdiv(Complex(1, 2)))
