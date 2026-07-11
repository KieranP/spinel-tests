# frozen_string_literal: true
# Float#!=
p(3.5 != 2.0)
a001 = 3.5; b001 = 2.0; p(a001 != b001)
a002 = 3.5; b002 = 2.0; c002 = (a002 != b002); p c002

# equal values, and Integer / Rational operands (coerced)
p(3.5 != 3.5)
p(3.0 != 3)
p(0.5 != Complex(1, 2))
a003 = 3.5; b003 = 3.5; c003 = (a003 != b003); p c003

# A Rational operand aborts compilation, though Float#== accepts one fine:
p(0.5 != Rational(1, 2))
a005 = 0.5; b005 = Rational(1, 2); c005 = (a005 != b005); p c005

# NaN is not equal to anything, including itself
p(Float::NAN != Float::NAN)
p(Float::NAN != 1.0)
a004 = Float::NAN; c004 = (a004 != a004); p c004

# comparison with a non-numeric operand
p(3.5 != "3.5")
p(3.5 != nil)
