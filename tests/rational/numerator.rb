# frozen_string_literal: true
# Rational#numerator
p(Rational(6,8).numerator)
a066 = Rational(6,8); p(a066.numerator)
a067 = Rational(6,8); v067 = a067.numerator; p v067
# reduced before reporting
p(Rational(100,50).numerator)
a068 = Rational(100,50); v068 = a068.numerator; p v068
# sign lives on the numerator after normalization
p(Rational(1,-2).numerator)
a069 = Rational(1,-2); v069 = a069.numerator; p v069
p(Rational(-1,2).numerator)
a070 = Rational(-1,2); v070 = a070.numerator; p v070
p(Rational(-1,-2).numerator)
a071 = Rational(-1,-2); v071 = a071.numerator; p v071
# zero numerator
p(Rational(0,5).numerator)
a072 = Rational(0,5); v072 = a072.numerator; p v072

arr827 = [Rational(1, 3), Rational(1, 2)]; p arr827[0].numerator + arr827[1].numerator
