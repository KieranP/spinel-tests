# frozen_string_literal: true
require 'set'

# Set#any?
p(Set[1, 2].any? { |x| x > 1 })
v611 = Set[1, 2].any? { |x| x > 9 }; p(v611)
p(Set[1, 2].any?)
a611 = Set[]; v612 = a611.any?; p(v612)

# String elements
b611 = Set["a", "bb"]; p(b611.any? { |s| s.length == 2 })
