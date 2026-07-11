# frozen_string_literal: true
# Rational#negative?
p(Rational(-1,2).negative?)
a065 = Rational(-1,2); v065 = a065.negative?; p v065
p(Rational(1,2).negative?)
p(Rational(0,1).negative?)
a066 = Rational(1,2); v066 = a066.negative?; p v066
# sign normalized from denominator counts as negative
p(Rational(1,-2).negative?)
a067 = Rational(1,-2); v067 = a067.negative?; p v067
# double-negative normalizes to positive
p(Rational(-1,-2).negative?)
a068 = Rational(-1,-2); v068 = a068.negative?; p v068
# zero is not negative
a069 = Rational(0,5); v069 = a069.negative?; p v069
