# frozen_string_literal: true
require 'set'

# Set#clear
c123 = Set[1, 2, 3]; c123.clear; p(c123.to_a)
d123 = Set[1, 2, 3]; d123.clear; p(d123.empty?)
e123 = Set[1, 2, 3]; f123 = (e123.clear); p(f123.to_a)

# String elements
g123 = Set["a", "b"]; g123.clear; p(g123.size)
