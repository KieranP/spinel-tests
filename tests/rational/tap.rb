# frozen_string_literal: true
# Rational#tap
a010 = Rational(1, 2); p(a010.tap { |o| o }.equal?(a010))
a011 = Rational(1, 2); v011 = a011.tap { |o| o }; p(v011.equal?(a011))
