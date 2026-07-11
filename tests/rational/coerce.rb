# frozen_string_literal: true
# Rational#coerce
p(Rational(1,2).coerce(2))
a059 = Rational(1,2); b059 = 2; v059 = a059.coerce(b059); p v059
p(Rational(1,2).coerce(Rational(1,3)))
a084 = Rational(1,2); b084 = Rational(1,3); v084 = a084.coerce(b084); p v084
p(Rational(1,2).coerce(0.5))
a085 = Rational(1,2); b085 = 0.5; v085 = a085.coerce(b085); p v085
