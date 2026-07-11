# frozen_string_literal: true
require 'set'

# Set#<=>
p(Set[1, 2] <=> Set[1, 2, 3])
v003 = (Set[1, 2] <=> Set[1, 2, 3]); p(v003)
p(Set[1, 2, 3] <=> Set[1, 2])
p(Set[1, 2] <=> Set[1, 2])
p(Set[1, 2] <=> Set[2, 3])

# String elements
a003 = Set["a", "b"]; b003 = Set["a", "b", "c"]; p(a003 <=> b003)
c003 = Set["a", "b"]; d003 = Set["x"]; p(c003 <=> d003)
