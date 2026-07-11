# frozen_string_literal: true
# Math.erfc

p(Math.erfc(0))
a001 = Math.erfc(0)
p a001

p(Math.erfc(1))
a002 = Math.erfc(1)
p a002.class
p a002

p(Math.erfc(-1))
p(Math.erfc(2))

b003 = 0.5
p(Math.erfc(b003))
c003 = Math.erfc(b003)
p c003

# special values (erfc = 1 - erf: 0.0 at +Infinity, 2.0 at -Infinity)
p(Math.erfc(Float::INFINITY))
p(Math.erfc(-Float::INFINITY))
p(Math.erfc(Float::NAN))

# erfc(0) == 1.0 exactly
p(Math.erfc(0))
p(Math.erfc(0.0))
p(Math.erfc(-0.0))

# coercion
p(Math.erfc(Rational(1, 2)).round(12))
e011 = Rational(1, 2)
p(Math.erfc(e011).round(12))
