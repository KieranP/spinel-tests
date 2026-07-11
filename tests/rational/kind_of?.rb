# frozen_string_literal: true
# Rational#kind_of?
p(Rational(1, 2).kind_of?(Rational))
p(Rational(1, 2).kind_of?(Object))
p(Rational(1, 2).kind_of?(String))
a016 = Rational(1, 2); p(a016.kind_of?(Rational))
a017 = Rational(1, 2); v017 = a017.kind_of?(String); p v017
