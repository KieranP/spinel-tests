# frozen_string_literal: true
# Rational#<
p(Rational(1,2) < Rational(2,3))
a041 = Rational(1,2); b041 = Rational(2,3); p(a041 < b041)
a042 = Rational(1,2); b042 = Rational(2,3); v042 = a042 < b042; p v042
p(Rational(1,2) < 1)
a043 = Rational(1,2); b043 = 0.4; p(a043 < b043)
