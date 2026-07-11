# frozen_string_literal: true
require 'set'

# Set#take_while
p(Set[1, 2, 3].take_while { |x| x < 3 })
v511 = Set[1, 2, 3].take_while { |x| x < 3 }; p(v511)
a511 = Set[1, 2, 3]; p(a511.take_while { |x| false })
b511 = Set["a", "bb"]; v512 = b511.take_while { |s| s.length < 2 }; p(v512)
