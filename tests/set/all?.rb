# frozen_string_literal: true
require 'set'

# Set#all?
p(Set[1, 2].all? { |x| x > 0 })
v601 = Set[1, 2].all? { |x| x > 1 }; p(v601)
p(Set[1, 2].all?)
a601 = Set[1, 2]; v602 = a601.all?; p(v602)
p(Set[].all? { |x| false })

# String elements
b601 = Set["a", "bb"]; p(b601.all? { |s| s.length < 3 })
