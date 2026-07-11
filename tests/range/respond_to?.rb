# frozen_string_literal: true
# Range#respond_to?
p((1..3).respond_to?(:first))
p((1..3).respond_to?(:definitely_not_a_method_xyz))
a020 = (1..3); p(a020.respond_to?(:first))
a021 = (1..3); v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
