# frozen_string_literal: true
# Rational#is_a?
p(Rational(1, 2).is_a?(Rational))
p(Rational(1, 2).is_a?(Object))
p(Rational(1, 2).is_a?(String))
a014 = Rational(1, 2); p(a014.is_a?(Rational))
a015 = Rational(1, 2); v015 = a015.is_a?(String); p v015
