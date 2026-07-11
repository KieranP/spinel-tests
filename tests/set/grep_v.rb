# frozen_string_literal: true
require 'set'

# Set#grep_v
p(Set[1, "a", 2].grep_v(Integer))
v671 = Set[1, "a", 2].grep_v(Integer); p(v671)
a671 = Set[1, 2, 3]; p(a671.grep_v(2..3))
b671 = Set["ab", "cd"]; v672 = b671.grep_v(/a/); p(v672)
