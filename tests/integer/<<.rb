# frozen_string_literal: true
# Integer#<<
p(1 << 4)
a010 = 1; p(a010 << 4)
a011 = 1; b011 = 4; p(a011 << b011)
a012 = 1; b012 = 4; c012 = (a012 << b012); p c012

# shift by zero
p(5 << 0)
a020 = 5; b020 = 0; c020 = (a020 << b020); p c020

# negative shift amount (acts as right shift); literal forms match
p(20 << -2)
p(5 << -1)
a030 = 20; p(a030 << -2)

# negative non-literal shift amount reverse-shifts correctly (20 << -2 => 5)
a031 = 20; b031 = -2; c031 = (a031 << b031); p c031

# shifts that grow into / past 64 bits (Bignum) via literals are constant-folded and match
p(1 << 62)
p(1 << 63)
p(1 << 64)
p(1 << 100)
p(3 << 70)

# WONTFIX: See docs/limitations.md - "By design — Integer overflow"
# a040 = 1; p(a040 << 64)

# WONTFIX: See docs/limitations.md - "By design — Integer overflow"
# a041 = 1; b041 = 100; c041 = (a041 << b041); p c041

# Bignum receiver
p((2 ** 100) << 4)
a050 = 2 ** 100; p(a050 << 4)
a051 = 2 ** 100; b051 = 4; c051 = (a051 << b051); p c051

# negative receiver, variable form: value correct, no warning
a060 = -8; b060 = 3; c060 = (a060 << b060); p c060

# negative LITERAL receiver: stdout value is correct on both sides, but Spinel emits C that
# left-shifts a negative signed value (undefined behaviour), drawing -Wshift-negative-value.
p(-8 << 1)
p(-1 << 4)

# Float argument: Ruby coerces the Float and returns a value (5 << 2.0 => 20).
begin; p(5 << 2.0); rescue => e070; p e070.class; end
