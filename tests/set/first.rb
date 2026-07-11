# frozen_string_literal: true
require 'set'

# Set#first
p(Set[1, 2, 3].first)
v481 = Set[1, 2, 3].first; p(v481)
a481 = Set[1, 2, 3]; p(a481.first(2))
b481 = Set["a", "b"]; v482 = b481.first; p(v482)

# empty set
p(Set[].first)
p(Set[1, 2].first(0))
