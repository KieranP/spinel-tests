# frozen_string_literal: true
require 'set'

# Set#add?
p(Set[1, 2].add?(3))
v006 = Set[1, 2].add?(3); p(v006)

# add? of an already-present element returns nil
p(Set[1, 2].add?(2).nil?)
a006 = Set[1, 2]; b006 = a006.add?(2); p(b006.nil?)

# String elements
p(Set["a", "b"].add?("c").to_a.sort)
c006 = Set["a"]; d006 = c006.add?("a"); p(d006.nil?)

# Symbol elements
e006 = Set[:a]; f006 = e006.add?(:b); p(f006.to_a.sort)
