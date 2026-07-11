# frozen_string_literal: true
# Float#+
p(0.5 + 1.5)
a001 = 0.5; b001 = 1.5; p(a001 + b001)
a002 = 0.5; b002 = 1.5; c002 = (a002 + b002); p c002

# Float + Integer (Integer coerces to Float)
p(0.5 + 3)
a004 = 0.5; b004 = 3; p(a004 + b004)
a005 = 0.5; b005 = 3; c005 = (a005 + b005); p c005

# negatives / zero
p(-1.5 + 0.5)
a006 = -2.5; b006 = 2.5; p(a006 + b006)

# Infinity / NaN
p(Float::INFINITY + 1.0)
p(Float::INFINITY + (-Float::INFINITY))
p(Float::NAN + 1.0)
a007 = Float::INFINITY; b007 = 1.0; c007 = (a007 + b007); p c007

p(0.5 + Rational(1, 2))
a003 = 0.5; b003 = Rational(1, 2); p(a003 + b003)

# Float + Complex
p(1.0 + Complex(1, 2))
a008 = 1.0; b008 = Complex(1, 2); c008 = (a008 + b008); p c008

r880 = (1.5 + "x" rescue $!.class); p r880

# Float#+ with a nil operand (Ruby raises TypeError)
r881 = (1.5 + nil rescue $!.class); p r881
