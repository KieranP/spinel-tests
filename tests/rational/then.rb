# frozen_string_literal: true
# Rational#then
a012 = Rational(1, 2); p(a012.then { |o| o.equal?(a012) })
a013 = Rational(1, 2); v013 = a013.then { |o| o.equal?(a013) }; p v013
