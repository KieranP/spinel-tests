# frozen_string_literal: true
require 'set'

# Set.[]
p(Set[1, 2, 3, 3].to_a.sort)
a304 = Set[1, 2, 2, 3]; p(a304.to_a.sort)
p(Set[].to_a)

# String elements with dedup
p(Set["a", "b", "a"].to_a.sort)
b304 = Set["x", "y", "x"]; p(b304.to_a.sort)

# Symbol elements
c304 = Set[:a, :b, :a]; p(c304.to_a.sort)
