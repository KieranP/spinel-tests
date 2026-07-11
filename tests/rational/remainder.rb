# frozen_string_literal: true
# Rational#remainder
p(Rational(7,2).remainder(Rational(1,3)))
a245 = Rational(7,2); b245 = Rational(1,3); v245 = a245.remainder(b245); p v245
p(Rational(7,2).remainder(2))
a246 = Rational(7,2); b246 = 2; v246 = a246.remainder(b246); p v246
p(Rational(7,2).remainder(-2))
p(Rational(7,2).remainder(2.0))
a247 = Rational(7,2); b247 = 2.0; v247 = a247.remainder(b247); p v247
