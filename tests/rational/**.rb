# frozen_string_literal: true
# Rational#**
p(Rational(3,4) ** 2)
a021 = Rational(3,4); p(a021 ** 2)
a022 = Rational(3,4); b022 = 2; p(a022 ** b022)
a023 = Rational(3,4); b023 = 2; v023 = a023 ** b023; p v023
p(Rational(3,4) ** -1)
a024 = Rational(3,4); v024 = a024 ** -1; p v024
p(Rational(1,2) ** 0.5)
a025 = Rational(1,2); v025 = a025 ** 0.5; p v025
p(Rational(2,3) ** Rational(1,2))
a026 = Rational(2,3); b026 = Rational(1,2); v026 = a026 ** b026; p v026
# integer exponent stays Rational
p((Rational(2,3) ** 3))
a027 = Rational(2,3); b027 = 3; v027 = a027 ** b027; p v027
p((Rational(2,3) ** 3).class)
a028 = Rational(2,3); v028 = (a028 ** 3).class; p v028
# exponent 0 -> (1/1); negative exponent inverts and stays Rational
p(Rational(2,3) ** 0)
a029 = Rational(2,3); b029 = 0; v029 = a029 ** b029; p v029
p(Rational(2,3) ** -2)
a030 = Rational(2,3); b030 = -2; v030 = a030 ** b030; p v030
p(Rational(-2,3) ** 3)
a031 = Rational(-2,3); v031 = a031 ** 3; p v031
p(Rational(-2,3) ** 2)
a032 = Rational(-2,3); v032 = a032 ** 2; p v032
# Float exponent -> Float
p((Rational(1,2) ** 0.5).class)
a033 = Rational(1,2); v033 = (a033 ** 0.5).class; p v033
# WONTFIX: See docs/limitations.md - "By design — Integer#** / Rational#** with a Rational exponent"
# p(Rational(3,4) ** Rational(2,1))
# a084 = Rational(3,4); b084 = Rational(2,1); v084 = a084 ** b084; p v084
# p(Rational(2,1) ** Rational(3,1))
# p(Rational(3,4) ** Rational(-1,1))
# a085 = Rational(3,4); b085 = Rational(-1,1); v085 = a085 ** b085; p v085
# A Rational base on the poly `**` path yields a Float: through a block param,
# and through a parameter shared with an Integer call site.
p([Rational(3, 2)].map { |r086| r086**2 })
v086 = [Rational(3, 2)].map { |r087| r087**2 }; p v086
def pw088(v, n); v**n; end
p(pw088(Rational(3, 2), 2))
v088 = pw088(Rational(3, 2), -1); p v088
# the Integer base sharing the same `**` site is correct
p(pw088(7, 2))
