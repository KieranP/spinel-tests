# frozen_string_literal: true
require 'set'

# Set#detect
p(Set[1, 2, 3].detect { |x| x > 1 })
v641 = Set[1, 2, 3].detect { |x| x > 1 }; p(v641)
a641 = Set[1, 2, 3]; p(a641.detect { |x| x > 9 })
b641 = Set["a", "bb"]; v642 = b641.detect { |s| s.length == 2 }; p(v642)
