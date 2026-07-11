# frozen_string_literal: true
require 'set'

# Set#chunk
p(Set[1, 1, 2, 3].chunk { |x| x.odd? }.to_a)
v831 = Set[1, 2, 3].chunk { |x| x.odd? }.to_a; p(v831)
a831 = Set["a", "bb", "cc"]; p(a831.chunk { |s| s.length }.to_a)
b831 = Set[1, 2]; v832 = b831.chunk { |x| 0 }.to_a; p(v832)
