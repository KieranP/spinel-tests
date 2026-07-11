# frozen_string_literal: true
require 'set'

# Set#count
p(Set[1, 2, 3].count)
a340 = Set[1, 2, 3]; p(a340.count)
b340 = Set[1, 2, 3, 4]; v340 = b340.count; p(v340)

# count with a block
p(Set[1, 2, 3, 4].count { |x| x.even? })
c340 = Set[1, 2, 3, 4]; d340 = (c340.count { |x| x.odd? }); p(d340)

# count with an argument
p(Set[1, 2, 3].count(2))
e340 = Set[1, 2, 3]; f340 = 9; p(e340.count(f340))

# String elements
g340 = Set["a", "bb", "cc"]; p(g340.count { |x| x.length == 2 })
