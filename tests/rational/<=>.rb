# frozen_string_literal: true
# Rational#<=>
p(Rational(1,2) <=> Rational(1,3))
a046 = Rational(1,2); b046 = Rational(1,3); p(a046 <=> b046)
a047 = Rational(1,2); b047 = Rational(1,3); v047 = a047 <=> b047; p v047
p(Rational(1,2) <=> 1)
a048 = Rational(1,2); b048 = 0.5; p(a048 <=> b048)
p(Rational(5,2) <=> 1)
a084 = Rational(1,2); b084 = "x"; v084 = (a084 <=> b084); p v084
# equal reduced values compare 0
p(Rational(1,2) <=> Rational(2,4))
a049 = Rational(1,2); b049 = Rational(2,4); v049 = a049 <=> b049; p v049
# against Integer and Float
p(Rational(3,2) <=> 1)
a050 = Rational(3,2); b050 = 1; v050 = a050 <=> b050; p v050
p(Rational(1,2) <=> 0.5)
a051 = Rational(1,2); b051 = 0.5; v051 = a051 <=> b051; p v051
p(Rational(1,2) <=> 2)
a052 = Rational(1,2); b052 = 2; v052 = a052 <=> b052; p v052
# Comparable operators derived from <=>
p(Rational(1,2) < Rational(2,3))
a053 = Rational(1,2); b053 = Rational(2,3); v053 = a053 < b053; p v053
p(Rational(1,2) >= Rational(1,2))
a054 = Rational(1,2); b054 = Rational(1,2); v054 = a054 >= b054; p v054
