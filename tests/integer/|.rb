# frozen_string_literal: true
# Integer#|
p(5 | 2)
a004 = 5; p(a004 | 2)
a005 = 5; b005 = 2; p(a005 | b005)
a006 = 5; b006 = 2; c006 = (a006 | b006); p c006

# zero
p(5 | 0)
p(0 | 0)
a010 = 5; b010 = 0; c010 = (a010 | b010); p c010

# negative operands (two's-complement)
p((-5) | 3)
p(5 | (-3))
p((-5) | (-3))
p((-1) | 0)
a020 = -5; p(a020 | 3)
a021 = -5; b021 = -3; p(a021 | b021)
a022 = -8; b022 = 3; c022 = (a022 | b022); p c022

# Bignum operand: bignum on the LEFT is correct; bignum on the RIGHT is broken.
p((2 ** 100) | 1)
p((2 ** 100) | (2 ** 64))
a030 = 2 ** 100; p(a030 | 1)
a031 = 2 ** 100; b031 = 1; c031 = (a031 | b031); p c031

# Bignum as the RIGHT operand
p(1 | (2 ** 100))
a040 = 1; b040 = 2 ** 100; p(a040 | b040)
a041 = 1; b041 = 2 ** 100; c041 = (a041 | b041); p c041

# Float argument: both Ruby and Spinel raise TypeError
begin; p(5 | 2.0); rescue => e040; p e040.class; end
