# frozen_string_literal: true
# Integer#div
p(7.div(2))
a043 = 7; p(a043.div(2))
a044 = 7; b044 = 2; p(a044.div(b044))
a045 = 7; b045 = 2; c045 = (a045.div(b045)); p c045

# Integer#div negative operands (floored division sign)
p((-7).div(2))
p(7.div(-2))
p((-7).div(-2))
a100 = -7; p(a100.div(2))
a101 = 7; b101 = -2; p(a101.div(b101))
a102 = -7; b102 = -2; c102 = (a102.div(b102)); p c102

# Integer#div zero dividend
p(0.div(5))
a103 = 0; b103 = 5; c103 = (a103.div(b103)); p c103

# Integer#div with a Float argument (Ruby floors the real quotient)
p(7.div(2.5))
p(7.div(2.5).class)
p((-7).div(2.5))
a104 = 7; b104 = 2.5; c104 = (a104.div(b104)); p c104

# Integer#div with a Bignum receiver
p((2 ** 70).div(3))
p((2 ** 70).div(3).class)
a105 = 2 ** 70; b105 = 3; c105 = (a105.div(b105)); p c105

# Integer#div by zero (ZeroDivisionError)
r106 = (7.div(0) rescue $!.class); p r106
a107 = 7; b107 = 0; r107 = (a107.div(b107) rescue $!.class); p r107

# Integer#div with a Rational argument (floors the exact quotient)
p(10.div(3r))
a108 = 10; b108 = 3r; c108 = (a108.div(b108)); p c108

r880 = (5.div("x") rescue $!.class); p r880

# Integer#div with a nil argument (Ruby raises TypeError)
r881 = (5.div(nil) rescue $!.class); p r881

# Kept last: Integer#div with a Complex argument raises NoMethodError under both, so it would
# suppress every line after it.
p(10.div(Complex(1, 2)))
r108x = (10.div(Complex(1, 2)) rescue $!.class); p r108x
