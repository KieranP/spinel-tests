# frozen_string_literal: true
require 'set'

# Set#intersect?
p(Set[1, 2].intersect?(Set[2, 3]))
v010 = Set[1, 2].intersect?(Set[2, 3]); p(v010)
p(Set[1, 2].intersect?(Set[3, 4]))

# String elements
p(Set["a", "b"].intersect?(Set["b", "c"]))
a010 = Set["a", "b"]; b010 = Set["c", "d"]; p(a010.intersect?(b010))

# Symbol elements
c010 = Set[:a, :b]; d010 = Set[:b]; e010 = (c010.intersect?(d010)); p(e010)
