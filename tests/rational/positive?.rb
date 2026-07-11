# frozen_string_literal: true
# Rational#positive?
p(Rational(1,2).positive?)
a068 = Rational(1,2); v068 = a068.positive?; p v068
p(Rational(-1,2).positive?)
p(Rational(0,1).positive?)
a069 = Rational(-1,2); v069 = a069.positive?; p v069
# double-negative normalizes to positive
p(Rational(-1,-2).positive?)
a070 = Rational(-1,-2); v070 = a070.positive?; p v070
# sign from denominator counts as negative -> not positive
p(Rational(1,-2).positive?)
a071 = Rational(1,-2); v071 = a071.positive?; p v071
# zero is not positive
a072 = Rational(0,5); v072 = a072.positive?; p v072
