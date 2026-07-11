# frozen_string_literal: true
require 'set'

# Set#delete?
p(Set[1, 2, 3].delete?(2))
v008 = Set[1, 2, 3].delete?(2); p(v008)

# delete? of an absent element returns nil
p(Set[1, 2, 3].delete?(9).nil?)
a008 = Set[1, 2, 3]; b008 = a008.delete?(9); p(b008.nil?)

# String elements
p(Set["a", "b"].delete?("a").to_a.sort)
c008 = Set["a", "b"]; d008 = c008.delete?("z"); p(d008.nil?)

# Symbol elements
e008 = Set[:a, :b]; f008 = e008.delete?(:a); p(f008.to_a.sort)
