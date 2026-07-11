# frozen_string_literal: true
# Float#respond_to?
p(1.5.respond_to?(:round))
p(1.5.respond_to?(:definitely_not_a_method_xyz))
a020 = 1.5; p(a020.respond_to?(:round))
a021 = 1.5; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
