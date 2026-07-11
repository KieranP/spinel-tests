# frozen_string_literal: true
# Rational#inspect
p(Rational(3,4).inspect)
a063 = Rational(3,4); p(a063.inspect)
a064 = Rational(3,4); v064 = a064.inspect; p v064
# negative sign on numerator
p(Rational(-1,2).inspect)
a065 = Rational(-1,2); v065 = a065.inspect; p v065
p(Rational(1,-2).inspect)
a066 = Rational(1,-2); v066 = a066.inspect; p v066
# integer-valued still shows denominator 1; reduced form
p(Rational(4,2).inspect)
a067 = Rational(4,2); v067 = a067.inspect; p v067
p(Rational(6,8).inspect)
a068 = Rational(6,8); v068 = a068.inspect; p v068
