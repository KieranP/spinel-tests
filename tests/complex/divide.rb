# frozen_string_literal: true
# Complex#/

p(Complex(3, 6) / 3)

a101 = Complex(3, 6)
p a101.class
p a101 / 3

a102 = Complex(3, 6)
b102 = 3
p b102.class
p a102 / b102

a103 = Complex(3, 6)
b103 = 3
c103 = a103 / b103
p c103.class
p c103

p(Complex(4.0, 8.0) / 2)

a104 = Complex(4.0, 8.0)
p a104.class
p a104 / 2

a105 = Complex(4.0, 8.0)
b105 = 2
p b105.class
p a105 / b105

a106 = Complex(4.0, 8.0)
b106 = 2
c106 = a106 / b106
p c106.class
p c106

p(Complex(3, 6) / 3.0)

a107 = Complex(3, 6)
p a107.class
p a107 / 3.0

a108 = Complex(3, 6)
b108 = 3.0
p b108.class
p a108 / b108

a109 = Complex(3, 6)
b109 = 3.0
c109 = a109 / b109
p c109.class
p c109

# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(2, 3) / Complex(1, 1)).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v031 = Complex(2, 3) / Complex(1, 1); p v031.class
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(2, 3) / 2).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v032 = Complex(2, 3) / 2; p v032.class
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(1, 2) / Rational(1, 2)).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v242 = Complex(1, 2) / Rational(1, 2); p v242.class

r243 = (Complex(2, 3) / "x" rescue $!.class); p r243
