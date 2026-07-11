# frozen_string_literal: true
# String#respond_to?
p("abc".respond_to?(:upcase))
p("abc".respond_to?(:definitely_not_a_method_xyz))
a020 = "abc"; p(a020.respond_to?(:upcase))
a021 = "abc"; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
