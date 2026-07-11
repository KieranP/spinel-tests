# frozen_string_literal: true
# Proc#respond_to?
p(->(a) { a }.respond_to?(:call))
p(->(a) { a }.respond_to?(:definitely_not_a_method_xyz))
a020 = ->(a) { a }; p(a020.respond_to?(:call))
a021 = ->(a) { a }; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
