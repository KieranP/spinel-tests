# frozen_string_literal: true
# Integer#respond_to?
p(5.respond_to?(:times))
p(5.respond_to?(:definitely_not_a_method_xyz))
a020 = 5; p(a020.respond_to?(:times))
a021 = 5; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
