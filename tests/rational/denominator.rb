# frozen_string_literal: true
# Rational#denominator
p(Rational(6,8).denominator)
a060 = Rational(6,8); p(a060.denominator)
a061 = Rational(6,8); v061 = a061.denominator; p v061
# reduced before reporting
p(Rational(100,50).denominator)
a062 = Rational(100,50); v062 = a062.denominator; p v062
# denominator is always positive; sign moves to the numerator
p(Rational(1,-2).denominator)
a063 = Rational(1,-2); v063 = a063.denominator; p v063
p(Rational(-1,-2).denominator)
a064 = Rational(-1,-2); v064 = a064.denominator; p v064
# integer-valued rational has denominator 1
p(Rational(4,2).denominator)
a065 = Rational(4,2); v065 = a065.denominator; p v065
# zero has denominator 1
p(Rational(0,5).denominator)
a066 = Rational(0,5); v066 = a066.denominator; p v066
