# frozen_string_literal: true
require 'set'

# Set#min
p(Set[3, 1, 2].min)
v014 = Set[3, 1, 2].min; p(v014)
a014 = Set[3, 1, 2]; p(a014.min)
p(Set[3, 1, 2].min(2))
b014 = Set["b", "a"]; v015 = b014.min; p(v015)
p(Set[].min)

# comparison block
p(Set[3, 1, 2].min { |x, y| y <=> x })
c014 = Set[3, 1, 2]; v016 = c014.min { |x, y| y <=> x }; p(v016)
