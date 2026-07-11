# frozen_string_literal: true
require 'set'

# Set#chain
p(Set[1, 2].chain([3, 4]).to_a)
v841 = Set[1, 2].chain([3, 4]).to_a; p(v841)
a841 = Set[1, 2]; p(a841.chain(Set[3]).to_a)
b841 = Set["a"]; v842 = b841.chain(["b"], ["c"]).to_a; p(v842)
