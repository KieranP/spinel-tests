# frozen_string_literal: true
# Float#fdiv
p(7.0.fdiv(2))
a001 = 7.0; b001 = 2; p(a001.fdiv(b001))
a002 = 7.0; b002 = 2; c002 = a002.fdiv(b002); p c002

# Float#fdiv with a Float / Rational divisor
p(1.0.fdiv(3.0))
p(7.0.fdiv(Rational(1, 2)))
a003 = 1.0; b003 = 3.0; c003 = a003.fdiv(b003); p c003

# division by zero yields signed Infinity; NaN operands propagate
p(1.0.fdiv(0.0))
p(-1.0.fdiv(0.0))
p(0.0.fdiv(0.0))
p(Float::NAN.fdiv(2))
p(Float::INFINITY.fdiv(2.0))

r880 = (1.5.fdiv("x") rescue $!.class); p r880

v881 = 7.0; w881 = -2.0; x881 = (v881.fdiv(w881)); p x881

# Float#fdiv with a nil argument (Ruby raises TypeError)
r882 = (1.5.fdiv(nil) rescue $!.class); p r882
