# frozen_string_literal: true
require 'set'

# Set#lazy
p(Set[1, 2, 3, 4].lazy.map { |x| x * 2 }.first(2))
v771 = Set[1, 2, 3, 4].lazy.map { |x| x * 2 }.first(2); p(v771)
a771 = Set[1, 2, 3, 4]; p(a771.lazy.select { |x| x.even? }.to_a)
b771 = Set["a", "bb"]; v772 = b771.lazy.map { |s| s.length }.to_a; p(v772)
