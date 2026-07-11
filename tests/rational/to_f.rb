# frozen_string_literal: true
# Rational#to_f
p(Rational(3,4).to_f)
a072 = Rational(3,4); p(a072.to_f)
a073 = Rational(3,4); v073 = a073.to_f; p v073
# negative and integer-valued
p(Rational(-1,4).to_f)
a074 = Rational(-1,4); v074 = a074.to_f; p v074
p(Rational(4,2).to_f)
a075 = Rational(4,2); v075 = a075.to_f; p v075
# zero
p(Rational(0,5).to_f)
a076 = Rational(0,5); v076 = a076.to_f; p v076
# result class is Float
p((Rational(3,4).to_f).class)
a077 = Rational(3,4); v077 = (a077.to_f).class; p v077
