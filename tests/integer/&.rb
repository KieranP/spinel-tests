# frozen_string_literal: true
# Integer#&
p(5 & 3)
a001 = 5; p(a001 & 3)
a002 = 5; b002 = 3; p(a002 & b002)
a003 = 5; b003 = 3; c003 = (a003 & b003); p c003

# zero
p(5 & 0)
p(0 & 0)
a010 = 5; b010 = 0; c010 = (a010 & b010); p c010

# negative operands (two's-complement)
p((-5) & 3)
p(5 & (-3))
p((-5) & (-3))
p((-1) & 255)
a020 = -5; p(a020 & 3)
a021 = -5; b021 = -3; p(a021 & b021)
a022 = -1; b022 = 255; c022 = (a022 & b022); p c022

# Bignum operand
p(5 & (2 ** 100))
p((2 ** 100) & 5)
p((2 ** 100) & (2 ** 100 - 1))
a030 = 2 ** 100; p(a030 & 6)
a031 = 2 ** 100; b031 = 6; c031 = (a031 & b031); p c031

# Float argument: both Ruby and Spinel raise TypeError
begin; p(5 & 2.0); rescue => e040; p e040.class; end
