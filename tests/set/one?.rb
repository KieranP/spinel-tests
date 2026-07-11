# frozen_string_literal: true
require 'set'

# Set#one?
p(Set[1, 2].one? { |x| x == 1 })
v631 = Set[1, 2].one? { |x| x > 0 }; p(v631)
p(Set[1].one?)
a631 = Set[1, 2]; v632 = a631.one?; p(v632)

# String elements
b631 = Set["a", "bb"]; p(b631.one? { |s| s.length == 2 })
