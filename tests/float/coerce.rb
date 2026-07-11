# frozen_string_literal: true
# Float#coerce
p(1.5.coerce(2))
a001 = 1.5; b001 = 2; p(a001.coerce(b001))
a002 = 1.5; b002 = 2; c002 = a002.coerce(b002); p c002
p(1.5.coerce(2.5))
p(1.5.coerce(2).map(&:class))

# coercing a Rational or Complex argument — Ruby returns a Float pair
p(1.0.coerce(Rational(1, 2)))
a003 = 1.0; b003 = Rational(1, 2); p(a003.coerce(b003))
p(2.0.coerce(Complex(1, 0)))

r880 = (1.5.coerce("x") rescue $!.class); p r880

# Float#coerce with a nil argument (Ruby raises TypeError)
r881 = (1.5.coerce(nil) rescue $!.class); p r881
