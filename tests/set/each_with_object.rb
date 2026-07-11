# frozen_string_literal: true
require 'set'

# Set#each_with_object
p(Set[1, 2, 3].each_with_object([]) { |x, acc| acc << x * 2 })
v561 = Set[1, 2, 3].each_with_object([]) { |x, acc| acc << x * 2 }; p(v561)
a561 = Set[1, 2, 3]; v562 = a561.each_with_object({}) { |x, acc| acc[x] = x * x }; p(v562)

# String elements
b561 = Set["a", "b"]; p(b561.each_with_object([]) { |s, acc| acc << s.upcase }.sort)
