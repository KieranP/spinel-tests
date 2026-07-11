# frozen_string_literal: true
# Float#**
p(2.0 ** 3.0)
a001 = 2.0; b001 = 3.0; p(a001 ** b001)
a002 = 2.0; b002 = 3.0; c002 = (a002 ** b002); p c002

# Float ** Integer, including zero and negative exponents
p(2.0 ** 10)
p(2.0 ** 0)
p(2.0 ** -2)
a003 = 2.0; b003 = -3; c003 = (a003 ** b003); p c003
p((-2.0) ** 3)

# non-negative base with a fractional exponent
p(4.0 ** 0.5)
p(9.0 ** 0.5)
p(4.0 ** Rational(1, 2))
a004 = 2.0; b004 = 0.5; c004 = (a004 ** b004); p c004

# zero base
p(0.0 ** 0)
p(0.0 ** 2.0)
p(0.0 ** -1)

# Infinity / NaN
p(Float::INFINITY ** 2.0)
p(2.0 ** Float::INFINITY)
p(1.0 ** Float::INFINITY)
p(Float::NAN ** 0)
p(Float::NAN ** 2.0)

# Negative base with a fractional exponent: Ruby returns a Complex; Spinel raises Math::DomainError.
# WONTFIX: See docs/limitations.md - "By design — Negative Float ** fractional exponent"
# p((-2.0) ** 0.5)
# WONTFIX: See docs/limitations.md - "By design — Negative Float ** fractional exponent"
# a005 = -8.0; b005 = (1.0 / 3); p(a005 ** b005)
# Complex exponent: Ruby returns a Complex; Spinel's Float ** never widens to Complex.
# WONTFIX: See docs/limitations.md - "By design — Negative Float ** fractional exponent"
# p(2.0 ** Complex(1, 1))

r880 = (1.5 ** "x" rescue $!.class); p r880

# Float#** with a nil exponent (Ruby raises TypeError)
r881 = (1.5 ** nil rescue $!.class); p r881
