# frozen_string_literal: true
# Rational#/
p(Rational(3,4) / Rational(1,2))
a037 = Rational(3,4); b037 = Rational(1,2); p(a037 / b037)
a038 = Rational(3,4); b038 = Rational(1,2); v038 = a038 / b038; p v038
p(Rational(3,4) / 2)
a039 = Rational(3,4); b039 = 2; p(a039 / b039)
p(Rational(3,4) / 0.5)
a040 = Rational(3,4); b040 = 0.5; v040 = a040 / b040; p v040
p(6 / Rational(3,4))
a084 = 6; b084 = Rational(3,4); v084 = a084 / b084; p v084
# quotient reduces to an integer-valued rational
p(Rational(3,4) / Rational(3,4))
a041 = Rational(3,4); b041 = Rational(3,4); v041 = a041 / b041; p v041
# negative divisor
p(Rational(3,4) / -2)
a042 = Rational(3,4); b042 = -2; v042 = a042 / b042; p v042
# dividing by an integer keeps Rational; Float contaminates to Float
p((Rational(3,4) / 2).class)
a043 = Rational(3,4); v043 = (a043 / 2).class; p v043
p((Rational(3,4) / 0.5).class)
a044 = Rational(3,4); v044 = (a044 / 0.5).class; p v044
# division by zero raises ZeroDivisionError
v045 = (Rational(3,4) / 0 rescue $!.class); p v045
a046 = Rational(3,4); b046 = 0; v046 = (a046 / b046 rescue $!.class); p v046
v047 = (Rational(3,4) / Rational(0,1) rescue $!.class); p v047
