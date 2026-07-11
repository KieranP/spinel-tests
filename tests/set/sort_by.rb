# frozen_string_literal: true
require 'set'

# Set#sort_by
p(Set[3, 1, 2].sort_by { |x| -x })
v421 = Set[3, 1, 2].sort_by { |x| -x }; p(v421)
a421 = Set[3, 1, 2]; p(a421.sort_by { |x| x % 2 })

# String elements sorted by length then value
b421 = Set["ccc", "a", "bb"]; v422 = b421.sort_by { |s| [s.length, s] }; p(v422)

# Symbol elements
c421 = Set[:bb, :a]; p(c421.sort_by { |s| s.to_s })
