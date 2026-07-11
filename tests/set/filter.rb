# frozen_string_literal: true
require 'set'

# Set#filter
p(Set[1, 2, 3].filter { |x| x > 1 })
v801 = Set[1, 2, 3].filter { |x| x > 1 }; p(v801)
a801 = Set[1, 2, 3]; p(a801.filter { |x| false })
b801 = Set["a", "bb"]; v802 = b801.filter { |s| s.length == 1 }; p(v802)
