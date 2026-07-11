# frozen_string_literal: true
# Rational#+
p(Rational(1,2) + Rational(1,3))
a027 = Rational(1,2); b027 = Rational(1,3); p(a027 + b027)
a028 = Rational(1,2); b028 = Rational(1,3); v028 = a028 + b028; p v028
p(Rational(1,2) + 1)
a029 = Rational(1,2); b029 = 1; p(a029 + b029)
p(Rational(1,2) + 0.5)
a030 = Rational(1,2); b030 = 0.5; v030 = a030 + b030; p v030
p(2 + Rational(1,2))
a084 = 2; b084 = Rational(1,2); v084 = a084 + b084; p v084
t300 = Rational(0, 1); t300 += Rational(1, 2); p t300
# sum reduces to an integer-valued rational
p(Rational(1,2) + Rational(1,2))
a035 = Rational(1,2); b035 = Rational(1,2); v035 = a035 + b035; p v035
# Integer keeps result Rational; Float contaminates to Float
p((Rational(1,2) + 1).class)
a036 = Rational(1,2); v036 = (a036 + 1).class; p v036
p((Rational(1,2) + 0.5).class)
a037 = Rational(1,2); v037 = (a037 + 0.5).class; p v037
p((0.5 + Rational(1,2)).class)
a038 = 0.5; b038 = Rational(1,2); v038 = (a038 + b038).class; p v038
# `+=` against a Rational read out of an Array is a front-end reject, so the file
# will not build. Kept commented.
b301 = [Rational(1), Rational(2)]
acc301 = Rational(0)
acc301 += b301[0]
p acc301
# the longhand form of the same statement compiles and matches
b302 = [Rational(1), Rational(2)]
acc302 = Rational(0)
acc302 = acc302 + b302[0]
p acc302
