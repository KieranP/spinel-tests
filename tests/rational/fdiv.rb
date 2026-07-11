# frozen_string_literal: true
# Rational#fdiv
p(Rational(7,2).fdiv(2))
a243 = Rational(7,2); b243 = 2; v243 = a243.fdiv(b243); p v243
p(Rational(7,2).fdiv(Rational(1,3)))
a246 = Rational(7,2); b246 = Rational(1,3); v246 = a246.fdiv(b246); p v246
