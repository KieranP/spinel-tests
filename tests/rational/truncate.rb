# frozen_string_literal: true
# Rational#truncate
p(Rational(7,2).truncate)
a080 = Rational(7,2); p(a080.truncate)
a081 = Rational(7,2); v081 = a081.truncate; p v081
p(Rational(-7,2).truncate)
a092 = Rational(-7,2); v092 = a092.truncate; p v092
p(Rational(314,100).truncate(1))
a082 = Rational(314,100); b082 = 1; v082 = a082.truncate(b082); p v082
# truncate toward zero for negative values (differs from floor)
p(Rational(-314,100).truncate(1))
a093 = Rational(-314,100); b093 = 1; v093 = a093.truncate(b093); p v093
# negative digit argument truncates to tens; result is Integer
p(Rational(12345,100).truncate(-1))
a094 = Rational(12345,100); b094 = -1; v094 = a094.truncate(b094); p v094
p(Rational(-12345,100).truncate(-1))
a095 = Rational(-12345,100); b095 = -1; v095 = a095.truncate(b095); p v095
# positive digits keep Rational; zero/no digits give Integer
p((Rational(314,100).truncate(1)).class)
a096 = Rational(314,100); v096 = (a096.truncate(1)).class; p v096
p((Rational(7,2).truncate).class)
a097 = Rational(7,2); v097 = (a097.truncate).class; p v097
