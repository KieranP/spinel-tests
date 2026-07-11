# frozen_string_literal: true
require 'set'

# Set#to_a
p(Set[3, 1, 2].to_a.sort)
a009 = Set[3, 1, 2]; c009 = (a009.to_a.sort); p c009

# String elements
p(Set["c", "a", "b"].to_a.sort)
d009 = Set["y", "x"]; e009 = (d009.to_a.sort); p e009

# Symbol elements
f009 = Set[:c, :a, :b]; p(f009.to_a.sort)

# to_a of an empty set
p(Set[].to_a)
