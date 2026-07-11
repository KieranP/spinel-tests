# frozen_string_literal: true
require 'set'

# Set#filter!
a317 = Set[1, 2, 3, 4]; a317.filter! { |x| x.even? }; p(a317.to_a.sort)
b318 = Set[1, 2, 3, 4]; c318 = (b318.filter! { |x| x.even? }); p(c318.to_a.sort)

# filter! returns nil when nothing is removed
d318 = Set[2, 4]; e318 = d318.filter! { |x| x.even? }; p(e318.nil?)

# String elements
f318 = Set["apple", "bat", "cat"]; f318.filter! { |x| x.length == 3 }; p(f318.to_a.sort)
g318 = Set["a", "bb", "ccc"]; h318 = (g318.filter! { |x| x.length > 1 }); p(h318.to_a.sort)
