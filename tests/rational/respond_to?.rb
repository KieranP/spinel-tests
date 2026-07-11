# frozen_string_literal: true
# Rational#respond_to?
p(Rational(1, 2).respond_to?(:numerator))
p(Rational(1, 2).respond_to?(:definitely_not_a_method_xyz))
a020 = Rational(1, 2); p(a020.respond_to?(:numerator))
a021 = Rational(1, 2); v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
