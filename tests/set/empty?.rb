# frozen_string_literal: true
require 'set'

# Set#empty?
p(Set[].empty?)
p(Set[1].empty?)
a315 = Set.new; p(a315.empty?)
b316 = Set[1, 2]; v316 = b316.empty?; p(v316)

# empty after clearing
c316 = Set[1, 2, 3]; c316.clear; p(c316.empty?)

# String elements
p(Set["a"].empty?)
d316 = Set.new; e316 = "x"; d316 << e316; p(d316.empty?)
