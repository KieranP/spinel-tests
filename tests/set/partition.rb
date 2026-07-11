# frozen_string_literal: true
require 'set'

# Set#partition
p(Set[1, 2, 3, 4].partition { |x| x.even? })
v471 = Set[1, 2, 3, 4].partition { |x| x.even? }; p(v471)
a471 = Set[1, 2, 3, 4]; p(a471.partition { |x| x > 2 })

# String elements
b471 = Set["a", "bb", "c"]; v472 = b471.partition { |s| s.length == 1 }; p(v472)

# nothing matches
p(Set[1, 2].partition { |x| x > 9 })
