# frozen_string_literal: true
# Rational#dup
p(Rational(1, 2).dup == Rational(1, 2))
a037 = Rational(1, 2); b037 = a037.dup; p(b037 == a037)
