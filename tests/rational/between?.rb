# frozen_string_literal: true
# Rational#between?
p(Rational(1,2).between?(Rational(0,1), Rational(1,1)))
a001 = Rational(1,2); b001 = Rational(0,1); c001 = Rational(1,1); v001 = a001.between?(b001, c001); p v001
