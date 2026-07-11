# frozen_string_literal: true
require 'set'

# Set#select!
a225 = Set[1, 2, 3, 4]; a225.select! { |x| x.even? }; p(a225.to_a.sort)
b225 = Set[1, 2, 3, 4]; c225 = (b225.select! { |x| x.even? }); p(c225.to_a.sort)

# select! returns nil when nothing is removed
d225 = Set[2, 4, 6]; e225 = d225.select! { |x| x.even? }; p(e225.nil?)

# String elements
f225 = Set["apple", "bat", "cat"]; f225.select! { |x| x.length == 3 }; p(f225.to_a.sort)
g225 = Set["a", "bb", "ccc"]; h225 = (g225.select! { |x| x.length > 1 }); p(h225.to_a.sort)
