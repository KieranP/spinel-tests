# frozen_string_literal: true
# Integer#>>
p(256 >> 2)
a013 = 256; p(a013 >> 2)
a014 = 256; b014 = 2; p(a014 >> b014)
a015 = 256; b015 = 2; c015 = (a015 >> b015); p c015

# shift by zero
p(5 >> 0)
a020 = 5; b020 = 0; c020 = (a020 >> b020); p c020

# shift beyond width -> 0 (or -1 for negatives, arithmetic shift); literal forms match
p(5 >> 10)
p(5 >> 100)

# non-literal shift amount >= 64 shifts to 0 correctly (5 >> 100 => 0)
a025 = 5; b025 = 100; c025 = (a025 >> b025); p c025

# negative shift amount (acts as left shift); literal forms match
p(5 >> -2)
p(20 >> -2)
a030 = 5; p(a030 >> -2)

# negative non-literal shift amount left-shifts correctly (5 >> -2 => 20)
a031 = 5; b031 = -2; c031 = (a031 >> b031); p c031

# negative receiver (arithmetic right shift)
p(-8 >> 1)
p(-8 >> 100)
p(-1 >> 1)
a040 = -8; p(a040 >> 1)
a041 = -8; b041 = 1; c041 = (a041 >> b041); p c041

# Bignum receiver
p((2 ** 100) >> 4)
p((2 ** 100) >> 100)
a050 = 2 ** 100; p(a050 >> 10)
a051 = 2 ** 100; b051 = 10; c051 = (a051 >> b051); p c051

# Float argument: Ruby coerces the Float and returns a value (5 >> 2.0 => 1).
begin; p(5 >> 2.0); rescue => e060; p e060.class; end
