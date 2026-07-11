# frozen_string_literal: true
# Rational#-@
p(-Rational(3,4))
a035 = Rational(3,4); p(-a035)
a036 = Rational(3,4); v036 = -a036; p v036

# negating a block parameter
p([Rational(1, 10), Rational(3, 10)].map { |r621| -r621 })
w621 = [Rational(1, 10)].map { |r622| -r622 }; p w621
