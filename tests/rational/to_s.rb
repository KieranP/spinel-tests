# frozen_string_literal: true
# Rational#to_s
p(Rational(3,4).to_s)
a078 = Rational(3,4); p(a078.to_s)
a079 = Rational(3,4); v079 = a079.to_s; p v079
# no parentheses (unlike inspect); sign on numerator
p(Rational(-1,2).to_s)
a080 = Rational(-1,2); v080 = a080.to_s; p v080
p(Rational(1,-2).to_s)
a081 = Rational(1,-2); v081 = a081.to_s; p v081
# integer-valued shows denominator 1; reduced form
p(Rational(4,2).to_s)
a082 = Rational(4,2); v082 = a082.to_s; p v082
p(Rational(6,8).to_s)
a083 = Rational(6,8); v083 = a083.to_s; p v083
