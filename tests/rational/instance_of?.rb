# frozen_string_literal: true
# Rational#instance_of?
p(Rational(1, 2).instance_of?(Rational))
p(Rational(1, 2).instance_of?(String))
a018 = Rational(1, 2); p(a018.instance_of?(Rational))
a019 = Rational(1, 2); v019 = a019.instance_of?(String); p v019
