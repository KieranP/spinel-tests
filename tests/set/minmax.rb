# frozen_string_literal: true
require 'set'

# Set#minmax
p(Set[3, 1, 2].minmax)
v451 = Set[3, 1, 2].minmax; p(v451)
a451 = Set[3, 1, 2]; p(a451.minmax)

# String elements
b451 = Set["b", "a", "c"]; v452 = b451.minmax; p(v452)

# empty set
p(Set[].minmax)
