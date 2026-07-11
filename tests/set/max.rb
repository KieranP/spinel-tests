# frozen_string_literal: true
require 'set'

# Set#max
p(Set[3, 1, 2].max)
v411 = Set[3, 1, 2].max; p(v411)
a411 = Set[3, 1, 2]; p(a411.max)
p(Set[3, 1, 2].max(2))
b411 = Set[3, 1, 2]; v412 = b411.max(2); p(v412)

# String elements
p(Set["a", "c", "b"].max)
c411 = Set["a", "c", "b"]; v413 = c411.max; p(v413)

# empty set
p(Set[].max)

# comparison block
p(Set[3, 1, 2].max { |x, y| y <=> x })
d411 = Set[3, 1, 2]; v414 = d411.max { |x, y| y <=> x }; p(v414)
