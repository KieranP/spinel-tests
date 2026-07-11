# frozen_string_literal: true
# Float#-
p(1.5 - 0.5)
a001 = 1.5; b001 = 0.5; p(a001 - b001)
a002 = 1.5; b002 = 0.5; c002 = (a002 - b002); p c002

# Float - Integer
p(1.0 - 3)
a004 = 1.0; b004 = 3; p(a004 - b004)
a005 = 1.0; b005 = 3; c005 = (a005 - b005); p c005

# negatives / signed zero
p(-1.5 - 0.5)
p(5.0 - 5.0)
p(-5.0 - -5.0)
a006 = 2.5; b006 = 5.0; c006 = (a006 - b006); p c006

# Infinity / NaN
p(Float::INFINITY - 1.0)
p(Float::INFINITY - Float::INFINITY)
p(Float::NAN - 1.0)

p(0.5 - Rational(1, 2))
a003 = 0.5; b003 = Rational(1, 2); p(a003 - b003)

# Float - Complex
p(1.0 - Complex(1, 2))
a007 = 1.0; b007 = Complex(1, 2); c007 = (a007 - b007); p c007

r880 = (1.5 - "x" rescue $!.class); p r880

# Float#- with a nil operand (Ruby raises TypeError)
r881 = (1.5 - nil rescue $!.class); p r881
