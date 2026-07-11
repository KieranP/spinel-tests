# frozen_string_literal: true
# Rational#-
p(Rational(1,2) - Rational(1,3))
a031 = Rational(1,2); b031 = Rational(1,3); p(a031 - b031)
a032 = Rational(1,2); b032 = Rational(1,3); v032 = a032 - b032; p v032
p(Rational(1,2) - 1)
a033 = Rational(1,2); b033 = 1; p(a033 - b033)
p(Rational(1,2) - 0.25)
a034 = Rational(1,2); b034 = 0.25; v034 = a034 - b034; p v034
p(3 - Rational(1,2))
a084 = 3; b084 = Rational(1,2); v084 = a084 - b084; p v084
# difference can go negative (sign on numerator)
p(Rational(1,3) - Rational(1,2))
a035 = Rational(1,3); b035 = Rational(1,2); v035 = a035 - b035; p v035
# difference reduces to zero
p(Rational(1,2) - Rational(1,2))
a036 = Rational(1,2); b036 = Rational(1,2); v036 = a036 - b036; p v036
# Integer keeps Rational; Float contaminates to Float
p((Rational(1,2) - 1).class)
a037 = Rational(1,2); v037 = (a037 - 1).class; p v037
p((Rational(1,2) - 0.25).class)
a038 = Rational(1,2); v038 = (a038 - 0.25).class; p v038
