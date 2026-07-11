# frozen_string_literal: true
require 'set'

# Set#disjoint?
p(Set[1, 2].disjoint?(Set[3, 4]))
v009 = Set[1, 2].disjoint?(Set[3, 4]); p(v009)
p(Set[1, 2].disjoint?(Set[2, 3]))

# String elements
p(Set["a", "b"].disjoint?(Set["c", "d"]))
a009 = Set["a", "b"]; b009 = Set["b", "c"]; p(a009.disjoint?(b009))

# Symbol elements
c009 = Set[:a, :b]; d009 = Set[:c]; e009 = (c009.disjoint?(d009)); p(e009)
