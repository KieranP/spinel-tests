# frozen_string_literal: true
require 'set'

# Set#dup
p(Set[1, 2, 3].dup.class)
a037 = Set[1, 2, 3]; b037 = a037.dup; p(b037.class)
a038 = Set[1, 2, 3]; v038 = a038.dup; p(v038 == a038)

# Mutating the dup writes through to the original.
a039 = Set[1, 2, 3]; b039 = a039.dup; b039 << 4; p(a039.to_a.sort)
a040 = Set[1, 2, 3]; b040 = a040.dup; b040.delete(1); v040 = a040.to_a.sort; p v040
