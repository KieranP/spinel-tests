# frozen_string_literal: true
require 'set'

# Set#difference
p(Set[1, 2, 3].difference([2, 3]).to_a.sort)
a311 = Set[1, 2, 3]; b311 = Set[2]; p(a311.difference(b311).to_a.sort)
c311 = Set[1, 2, 3]; d311 = (c311.difference([1])); p(d311.to_a.sort)

# String elements
p(Set["a", "b", "c"].difference(Set["b"]).to_a.sort)
e311 = Set["a", "b", "c"]; f311 = Set["a", "c"]; p(e311.difference(f311).to_a.sort)

# Symbol elements
g311 = Set[:a, :b, :c]; h311 = (g311.difference([:a, :b])); p(h311.to_a.sort)

# extra arguments
r098 = (Set[1, 2, 3].difference([2], [3]).to_a.sort rescue $!.class); p r098
s098 = Set[1, 2, 3]; t098 = (s098.difference([2], [3]).to_a.sort rescue $!.class); p t098
