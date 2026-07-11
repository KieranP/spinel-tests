# frozen_string_literal: true
require 'set'

# Set#clone
p(Set[1, 2, 3].clone.class)
a041 = Set[1, 2, 3]; b041 = a041.clone; p(b041.class)
a042 = Set[1, 2, 3]; v042 = a042.clone; p(v042 == a042)

# Mutating the clone writes through to the original.
a043 = Set[1, 2, 3]; b043 = a043.clone; b043 << 4; p(a043.to_a.sort)
a044 = Set[1, 2, 3]; b044 = a044.clone; b044 << 4; v044 = a044.to_a.sort; p v044
