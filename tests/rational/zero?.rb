# frozen_string_literal: true
# Rational#zero?
p(Rational(0,1).zero?)
a083 = Rational(1,2); v083 = a083.zero?; p v083
# true for zero regardless of denominator
p(Rational(0,5).zero?)
a084 = Rational(0,5); v084 = a084.zero?; p v084
# false for nonzero (positive and negative)
p(Rational(1,2).zero?)
a085 = Rational(1,2); v085 = a085.zero?; p v085
p(Rational(-1,2).zero?)
a086 = Rational(-1,2); v086 = a086.zero?; p v086
