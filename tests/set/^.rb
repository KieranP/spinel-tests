# frozen_string_literal: true
require 'set'

# Set#^ (symmetric difference)
p((Set[1, 2, 3] ^ Set[2, 3, 4]).to_a.sort)
v005 = (Set[1, 2, 3] ^ Set[2, 3, 4]).to_a.sort; p(v005)
c005 = Set[1, 2, 3]; d005 = [2, 3, 4]; p((c005 ^ d005).to_a.sort)

# String elements
p((Set["a", "b", "c"] ^ Set["b", "c", "d"]).to_a.sort)
e005 = Set["a", "b"]; f005 = Set["b", "c"]; g005 = (e005 ^ f005); p(g005.to_a.sort)

# Symbol elements
h005 = Set[:a, :b, :c]; i005 = [:c, :d]; p((h005 ^ i005).to_a.sort)
