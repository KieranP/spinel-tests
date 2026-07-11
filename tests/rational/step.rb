# frozen_string_literal: true
# Rational#step (Numeric#step)
a001 = []; Rational(1,2).step(Rational(5,2), 1) { |x| a001 << x }; p a001
a002 = Rational(1,2).step(Rational(5,2), 1).to_a; p a002
