# frozen_string_literal: true
require 'set'

# Set#uniq
p(Set[1, 2, 3].uniq)
v691 = Set[1, 2, 3].uniq; p(v691)
a691 = Set[1, 2, 3, 4]; p(a691.uniq { |x| x % 2 })
b691 = Set["a", "bb", "c"]; v692 = b691.uniq { |s| s.length }; p(v692)
