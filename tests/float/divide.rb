# frozen_string_literal: true
# Float#/
p(1.0 / 2.0)
a001 = 1.0; b001 = 2.0; p(a001 / b001)
a002 = 1.0; b002 = 2.0; c002 = (a002 / b002); p c002

# Float / Integer
p(7.0 / 2)
a004 = 7.0; b004 = 2; p(a004 / b004)
a005 = 7.0; b005 = 2; c005 = (a005 / b005); p c005

# division by zero yields signed Infinity, 0.0/0.0 yields NaN
p(1.0 / 0.0)
p(-1.0 / 0.0)
p(0.0 / 0.0)
p(1.0 / 0)
a006 = 1.0; b006 = 0.0; c006 = (a006 / b006); p c006

# Infinity operands
p(Float::INFINITY / Float::INFINITY)
p(1.0 / Float::INFINITY)

p(0.5 / Rational(1, 2))
a003 = 0.5; b003 = Rational(1, 2); p(a003 / b003)

# Float / Complex
p(2.0 / Complex(1, 1))
a007 = 2.0; b007 = Complex(1, 1); c007 = (a007 / b007); p c007

r880 = (1.5 / "x" rescue $!.class); p r880

# Float#/ with a nil operand (Ruby raises TypeError)
r881 = (1.5 / nil rescue $!.class); p r881
