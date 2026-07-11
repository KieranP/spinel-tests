# frozen_string_literal: true
# Float#*
p(0.5 * 3.0)
a001 = 0.5; b001 = 3.0; p(a001 * b001)
a002 = 0.5; b002 = 3.0; c002 = (a002 * b002); p c002

# Float * Integer
p(0.5 * 3)
a004 = 0.5; b004 = 3; p(a004 * b004)
a005 = 0.5; b005 = 3; c005 = (a005 * b005); p c005

# signed zero / negatives
p(0.0 * -1.0)
p(-2.5 * -2.0)
a006 = 0.0; b006 = -1.0; c006 = (a006 * b006); p c006

# Infinity / NaN
p(Float::INFINITY * 2.0)
p(Float::INFINITY * 0.0)
p(Float::NAN * 0.0)

p(0.5 * Rational(1, 2))
a003 = 0.5; b003 = Rational(1, 2); p(a003 * b003)

# Float * Complex
p(2.0 * Complex(1, 2))
a007 = 2.0; b007 = Complex(1, 2); c007 = (a007 * b007); p c007

r880 = (1.5 * "x" rescue $!.class); p r880

# Float#* with a nil operand (Ruby raises TypeError)
r881 = (1.5 * nil rescue $!.class); p r881
