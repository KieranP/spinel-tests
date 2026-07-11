# frozen_string_literal: true
# Rational#frozen?
p(Rational(1, 2).frozen?)
a004 = Rational(1, 2); p(a004.frozen?)
a005 = Rational(1, 2); v005 = a005.frozen?; p v005
