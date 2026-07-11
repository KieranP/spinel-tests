# frozen_string_literal: true
# Rational#to_i
p(Rational(7,2).to_i)
a074 = Rational(7,2); p(a074.to_i)
a075 = Rational(7,2); v075 = a075.to_i; p v075
# truncates toward zero for negatives
p(Rational(-7,2).to_i)
a076 = Rational(-7,2); v076 = a076.to_i; p v076
# integer-valued rational
p(Rational(4,2).to_i)
a077 = Rational(4,2); v077 = a077.to_i; p v077
# below one truncates to zero
p(Rational(1,2).to_i)
a078 = Rational(1,2); v078 = a078.to_i; p v078
p(Rational(-1,2).to_i)
a079 = Rational(-1,2); v079 = a079.to_i; p v079
# to_i is an alias of truncate; result is Integer
p((Rational(7,2).to_i).class)
a080 = Rational(7,2); v080 = (a080.to_i).class; p v080
# to_i on a Rational produced by sum / inject returns 0
p([Rational(7,2)].sum.to_i)
a081 = [Rational(7,2)].sum; v081 = a081.to_i; p v081
p([Rational(7,2)].inject(0) { |s081, x081| s081 + x081 }.to_i)
# truncate on the same value is correct
p([Rational(7,2)].sum.truncate)
a082 = [Rational(7,2)].sum; v082 = a082.truncate; p v082
