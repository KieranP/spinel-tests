# frozen_string_literal: true
# Complex#respond_to?
p(Complex(2, 3).respond_to?(:real))
p(Complex(2, 3).respond_to?(:definitely_not_a_method_xyz))
a020 = Complex(2, 3); p(a020.respond_to?(:real))
a021 = Complex(2, 3); v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
