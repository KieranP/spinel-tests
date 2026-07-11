# frozen_string_literal: true
require 'set'

# Set#delete_if
a225 = Set[1, 2, 3, 4]; a225.delete_if { |x| x.even? }; p(a225.to_a.sort)
b225 = Set[1, 2, 3, 4]; c225 = (b225.delete_if { |x| x.even? }); p(c225.to_a.sort)

# delete_if always returns self
d225 = Set[1, 3]; e225 = d225.delete_if { |x| x.even? }; p(e225.to_a.sort)

# String elements
f225 = Set["apple", "bat", "cat"]; f225.delete_if { |x| x.length == 3 }; p(f225.to_a.sort)
g225 = Set["a", "bb", "ccc"]; h225 = (g225.delete_if { |x| x.length > 1 }); p(h225.to_a.sort)
