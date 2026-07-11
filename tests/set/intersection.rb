# frozen_string_literal: true
require 'set'

# Set#intersection
p(Set[1, 2, 3].intersection([2, 3, 4]).to_a.sort)
a321 = Set[1, 2, 3]; b321 = Set[2, 3, 4]; p(a321.intersection(b321).to_a.sort)
c321 = Set[1, 2, 3]; d321 = (c321.intersection([3])); p(d321.to_a.sort)

# String elements
p(Set["a", "b", "c"].intersection(Set["b", "c", "d"]).to_a.sort)
e321 = Set["a", "b"]; f321 = Set["b", "c"]; p(e321.intersection(f321).to_a.sort)

# Symbol elements
g321 = Set[:a, :b, :c]; h321 = (g321.intersection([:b, :c])); p(h321.to_a.sort)

# Range argument
p(Set[1, 2].intersection(2..4).to_a.sort)
i321 = Set[1, 2]; j321 = (i321.intersection(2..4)); p(j321.to_a.sort)

# Hash argument (each entry is a [key, value] pair)
k321 = Set[[:a, 1]]; p(k321.intersection({ a: 1, b: 2 }).to_a)

# extra arguments
l321 = (Set[1, 2].intersection([1, 2], [2]).to_a rescue $!.class); p l321
