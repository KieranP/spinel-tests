# frozen_string_literal: true
# Enumerator#respond_to?
p([1, 2, 3].each.respond_to?(:next))
p([1, 2, 3].each.respond_to?(:definitely_not_a_method_xyz))
a020 = [1, 2, 3].each; p(a020.respond_to?(:next))
a021 = [1, 2, 3].each; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
