# frozen_string_literal: true
require 'set'

# Set#find_all
p(Set[1, 2, 3].find_all { |x| x > 1 })
v811 = Set[1, 2, 3].find_all { |x| x > 1 }; p(v811)
a811 = Set[1, 2, 3]; p(a811.find_all { |x| true })
b811 = Set["a", "bb"]; v812 = b811.find_all { |s| s.length == 2 }; p(v812)
