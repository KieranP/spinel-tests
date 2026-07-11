# frozen_string_literal: true
# Integer#**
p(2 ** 10)
a107 = 2; p(a107 ** 10)
a108 = 2; b108 = 10; p(a108 ** b108)
a109 = 2; b109 = 10; c109 = (a109 ** b109); p c109

# exponent 0 and 1
p(5 ** 0)
p(5 ** 1)
p(0 ** 0)
a110 = 5; p(a110 ** 0)
a111 = 5; b111 = 1; c111 = (a111 ** b111); p c111

# base 0 and 1
p(0 ** 5)
p(1 ** 100)

# negative base, even/odd exponent
p((-2) ** 3)
p((-2) ** 4)
a120 = -2; p(a120 ** 3)
a121 = -2; b121 = 4; c121 = (a121 ** b121); p c121

# big results (Bignum) via a literal are constant-folded and match
p(2 ** 64)
p(2 ** 100)
p(10 ** 20)

# WONTFIX: See docs/limitations.md - "By design — Integer overflow"
# a130 = 2; p(a130 ** 100)
# a131 = 10; b131 = 20; c131 = (a131 ** b131); p c131

# Float exponent
p(2 ** 3.0)
p(2 ** 0.5)
p(4 ** 0.5)
a140 = 2; p(a140 ** 3.0)
a141 = 2; b141 = 0.5; p(a141 ** b141)
a142 = 2; b142 = 3.0; c142 = (a142 ** b142); p c142

# ** with a Complex exponent evaluates to the correct Complex. + - * / % <=> with a Rational all work.
p(3 ** Complex(0, 1))
a146 = 3; b146 = Complex(0, 1); c146 = (a146 ** b146); p c146

# WONTFIX: See docs/limitations.md - "By design — Integer#** / Rational#** with a Rational exponent"
# p(3 ** 2r)
# a145 = 3; b145 = 2r; c145 = (a145 ** b145); p c145

# literal negative exponent -> Rational (matches: statically typed Rational)
p(2 ** -1)
p(4 ** -2)
a150 = 2; p(a150 ** -1)

# base 0 with negative exponent -> ZeroDivisionError (rescue-wrapped so backtrace omission does not diff)
begin; p(0 ** -1); rescue => e150; p e150.class; p e150.message; end

# WONTFIX: See docs/limitations.md - "By design — Integer#** with a negative exponent"
# a160 = 2; b160 = -1; p(a160 ** b160)
