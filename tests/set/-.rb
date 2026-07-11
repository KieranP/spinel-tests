# frozen_string_literal: true
require 'set'

# Set#-
p((Set[1, 2, 3] - Set[2]).to_a.sort)
a002 = Set[1, 2, 3]; b002 = Set[2]; p((a002 - b002).to_a.sort)
c002 = Set[1, 2, 3]; d002 = [2]; p((c002 - d002).to_a.sort)

# String elements
p((Set["a", "b", "c"] - Set["b"]).to_a.sort)
e002 = Set["a", "b", "c"]; f002 = Set["b", "c"]; g002 = (e002 - f002); p(g002.to_a.sort)

# Symbol elements
h002 = Set[:a, :b, :c]; i002 = [:a]; p((h002 - i002).to_a.sort)

# subtract everything -> empty
j002 = Set[1, 2]; k002 = (j002 - [1, 2]); p(k002.to_a.sort)

# Hash operand (each entry is a [key, value] pair)
p((Set[1, 2] - { 1 => :a }).to_a.sort)
p099 = Set[[:a, 1]]; q099 = (p099 - { a: 1 }); p(q099.to_a)
