# frozen_string_literal: true
require 'set'

# Set#member?
p(Set[1, 2, 3].member?(2))
p(Set[1, 2, 3].member?(9))
a324 = Set[1, 2, 3]; b324 = 2; p(a324.member?(b324))
c325 = Set[1, 2, 3]; v325 = c325.member?(2); p(v325)

# String elements
p(Set["a", "b"].member?("a"))
p(Set["a", "b"].member?("z"))
d325 = Set["a", "b"]; e325 = "b"; p(d325.member?(e325))

# Symbol elements
f325 = Set[:a, :b]; g325 = (f325.member?(:a)); p(g325)
