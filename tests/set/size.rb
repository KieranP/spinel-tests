# frozen_string_literal: true
require 'set'

# Set#size
p(Set[1, 2, 3].size)
a007 = Set[1, 2, 3]; p(a007.size)

# duplicates do not count
p(Set[1, 1, 2].size)
p(Set[].size)

# String elements
b007 = Set["a", "b", "a"]; p(b007.size)
c007 = Set["x", "y"]; v007 = c007.size; p(v007)
