# frozen_string_literal: true
# Integer#%
p(7 % 3)
a306 = 7; p(a306 % 3)
a307 = 7; b307 = 3; p(a307 % b307)
a308 = 7; b308 = 3; c308 = (a308 % b308); p c308

# zero dividend, exact division
p(0 % 5)
p(6 % 3)
a310 = 0; b310 = 5; c310 = (a310 % b310); p c310

# negative operands (Ruby result takes sign of divisor)
p(-7 % 3)
p(7 % -3)
p(-7 % -3)
a320 = -7; p(a320 % 3)
a321 = 7; b321 = -3; p(a321 % b321)
a322 = -7; b322 = -3; c322 = (a322 % b322); p c322

# Float argument
p(7 % 3.5)
p(-7.5 % 2)
a330 = 7; p(a330 % 3.5)
a331 = 7; b331 = 3.5; c331 = (a331 % b331); p c331

# negative Float divisor (result takes the divisor's sign)
p(7 % -3.5)
p(-7 % -3.5)
p(7.5 % -2)
a332 = 7; b332 = -3.5; c332 = (a332 % b332); p c332

# Bignum operand
p((2 ** 100) % 7)
p(7 % (2 ** 100))
a340 = 2 ** 100; p(a340 % 1000)
a341 = 2 ** 100; b341 = 1000; c341 = (a341 % b341); p c341

# modulo by zero -> ZeroDivisionError (rescue-wrapped so backtrace omission does not diff)
begin; p(5 % 0); rescue => e350; p e350.class; p e350.message; end
a351 = 5; begin; p(a351 % 0); rescue => e351; p e351.class; end

# String argument: Ruby raises TypeError.
begin; p(5 % "x"); rescue => e360; p e360.class; end
