# frozen_string_literal: true
require 'set'

# Set#sort
p(Set[3, 1, 2].sort)
v401 = Set[3, 1, 2].sort; p(v401)
a401 = Set[3, 1, 2]; p(a401.sort)
b401 = Set["b", "a", "c"]; v402 = b401.sort; p(v402)

# Symbol elements
c401 = Set[:c, :a, :b]; p(c401.sort)

# Float elements
p(Set[2.5, 1.5].sort)

# comparison block
p(Set[3, 1, 2].sort { |x, y| y <=> x })
d401 = Set[3, 1, 2]; v403 = d401.sort { |x, y| y <=> x }; p(v403)
