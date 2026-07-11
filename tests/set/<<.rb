# frozen_string_literal: true
require 'set'

# Set#<<
a003 = Set[1, 2, 3]; a003 << 4; p(a003.include?(4))
a004 = Set[1, 2]; b004 = 5; a004 << b004; p(a004.to_a.sort)

# chained <<
a005 = Set[1]; a005 << 2 << 3; p(a005.to_a.sort)

# String elements
a006 = Set["a", "b"]; a006 << "c"; p(a006.to_a.sort)
a007 = Set["x"]; c007 = (a007 << "y"); p(c007.to_a.sort)

# Symbol elements
a008 = Set[:a]; b008 = :b; a008 << b008; p(a008.to_a.sort)

require 'set'
hs902 = { z: Set.new }
hs902[:z] << 1
p hs902[:z].to_a
adj902 = Hash.new { |h, k| h[k] = Set.new }; adj902[0] << 1; adj902[0] << 2; p adj902[0].size
