# frozen_string_literal: true
require 'set'

# Set#chunk_while
p(Set[1, 2, 4, 5].chunk_while { |x, y| y == x + 1 }.to_a)
v731 = Set[1, 2, 4, 5].chunk_while { |x, y| y == x + 1 }.to_a; p(v731)
a731 = Set[1, 2, 3]; p(a731.chunk_while { |x, y| false }.to_a)
b731 = Set["a", "b", "z"]; v732 = b731.chunk_while { |x, y| y.ord == x.ord + 1 }.to_a; p(v732)
