# frozen_string_literal: true
# Rational#nonzero?
p(Rational(1,2).nonzero?)
a001 = Rational(1,2); v001 = a001.nonzero?; p v001
p(Rational(0,1).nonzero?)
a002 = Rational(0,1); v002 = a002.nonzero?; p v002
