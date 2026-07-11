# frozen_string_literal: true
# Rational#==
p(Rational(1,2) == Rational(2,4))
a049 = Rational(1,2); b049 = Rational(2,4); p(a049 == b049)
a050 = Rational(1,2); b050 = Rational(2,4); v050 = a050 == b050; p v050
p(Rational(2,1) == 2)
a051 = Rational(1,2); b051 = 0.5; p(a051 == b051)
a052 = Rational(1,2); b052 = 0.5; v052 = (a052 == b052); p v052
p(Rational(1,2) == nil)
p(Rational(1,2) == "x")
a053 = Rational(1,2); b053 = "x"; v053 = (a053 == b053); p v053
# integer-valued rational equals the Integer and the Float
p(Rational(4,2) == 2)
a054 = Rational(4,2); b054 = 2; v054 = (a054 == b054); p v054
p(Rational(1,2) == 0.5)
a055 = Rational(1,2); b055 = 0.5; v055 = (a055 == b055); p v055
# unequal rationals
p(Rational(1,2) == Rational(1,3))
a056 = Rational(1,2); b056 = Rational(1,3); v056 = (a056 == b056); p v056
# negative-form equality after normalization
p(Rational(-1,2) == Rational(1,-2))
a057 = Rational(-1,2); b057 = Rational(1,-2); v057 = (a057 == b057); p v057

# compares false (swapped operands are fine); these run and diverge at runtime.
[Rational(5, 6)].each { |r402| p(Rational(5, 6) == r402) }
x403 = [Rational(5, 6)].first; p(Rational(5, 6) == x403)
v404 = (Rational(5, 6) == [Rational(5, 6)].first); p v404
