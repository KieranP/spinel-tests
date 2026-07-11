# frozen_string_literal: true
require 'set'

# Set#map!
a225 = Set[1, 2, 3, 4]; a225.map! { |x| x * 2 }; p(a225.to_a.sort)
b225 = Set[1, 2, 3, 4]; c225 = (b225.map! { |x| x * 2 }); p(c225.to_a.sort)

# String elements
d225 = Set["a", "b"]; d225.map! { |x| x + x }; p(d225.to_a.sort)
e225 = Set["x", "y"]; f225 = (e225.map! { |x| x.upcase }); p(f225.to_a.sort)

# collisions collapse to fewer elements
g225 = Set[1, 2, 3, 4]; g225.map! { |x| x % 2 }; p(g225.to_a.sort)
