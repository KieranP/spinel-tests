# frozen_string_literal: true
# Rational#rationalize
p(Rational(1,3).rationalize)
a069 = Rational(1,3); p(a069.rationalize)
a070 = Rational(1,3); v070 = a070.rationalize; p v070
p(Rational(-3,4).rationalize)
a071 = Rational(-3,4); v071 = a071.rationalize; p v071
p(Rational(4,2).rationalize)
a072 = Rational(4,2); v072 = a072.rationalize; p v072
v073 = (Rational(5000,10001).rationalize(Rational(1,100)) rescue $!.class); p v073
a074 = Rational(5000,10001); b074 = Rational(1,100); v074 = (a074.rationalize(b074) rescue $!.class); p v074
