# frozen_string_literal: true
# Rational#eql?
p(Rational(1, 2).eql?(Rational(1, 2)))
a029 = Rational(1, 2); b029 = Rational(1, 2); p(a029.eql?(b029))
a030 = Rational(1, 2); v030 = a030.eql?(a030); p v030

[Rational(5, 6)].each { |r405| p(Rational(5, 6).eql?(r405)) }
v406 = Rational(5, 6).eql?([Rational(5, 6)].first); p v406
