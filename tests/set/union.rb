# frozen_string_literal: true
require 'set'

# Set#union
p(Set[1, 2].union(Set[2, 3]).to_a.sort)
a332 = Set[1, 2]; b332 = Set[2, 3]; p(a332.union(b332).to_a.sort)
c332 = Set[1, 2]; d332 = (c332.union([9])); p(d332.to_a.sort)

# String elements
p(Set["a", "b"].union(Set["b", "c"]).to_a.sort)
e332 = Set["a", "b"]; f332 = Set["b", "c"]; g332 = (e332.union(f332)); p(g332.to_a.sort)

# Symbol elements
h332 = Set[:a, :b]; i332 = Set[:b, :c]; p(h332.union(i332).to_a.sort)
j332 = Set[:a, :b]; k332 = (j332.union([:c])); p(k332.to_a.sort)

# chained union
l332 = Set[1, 2]; p(l332.union([3]).union(Set[4]).to_a.sort)

# Range argument
r333 = (Set[1, 2].union(2..4).to_a.sort rescue $!.class); p r333
m332 = Set[1, 2]; r334 = (m332.union(2..4).to_a.sort rescue $!.class); p r334

# extra arguments
o332 = (Set[1].union([2], Set[3]).to_a.sort rescue $!.class); p o332
p332 = Set[1]; q332 = (p332.union([2], [3]).to_a.sort rescue $!.class); p q332
