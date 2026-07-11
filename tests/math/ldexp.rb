# frozen_string_literal: true
# Math.ldexp

p(Math.ldexp(0.5, 4))
a001 = Math.ldexp(0.5, 4)
p a001

p(Math.ldexp(1.0, 3))
a002 = Math.ldexp(1.0, 3)
p a002.class
p a002

p(Math.ldexp(0.5, -2))
p(Math.ldexp(2.0, 0))
p(Math.ldexp(0.75, 5))

# both arguments in variables
b003 = 0.5
c003 = 3
p(Math.ldexp(b003, c003))
d003 = Math.ldexp(b003, c003)
p d003

# fraction as a Rational
p(Math.ldexp(Rational(1, 2), 4))

# negative / zero exponent from a variable
g010 = -3
p(Math.ldexp(8.0, g010))

# exponent taken from an array element fails to compile
a011 = [0.5, 4]; p(Math.ldexp(0.5, a011[1]))
f012 = Math.frexp(1234.5); p(Math.ldexp(f012[0], f012[1]))

# negative fraction / large exponent
p(Math.ldexp(-0.5, 3))
p(Math.ldexp(0.5, 1000))

# a Bignum exponent: Ruby raises RangeError, Spinel truncates it and overflows
begin; p(Math.ldexp(1.0, 2**100)); rescue => e020; p e020.class; end

# overflow to Infinity with a large in-range exponent
p(Math.ldexp(1.0, 100000))
