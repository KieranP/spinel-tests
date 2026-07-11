# frozen_string_literal: true
require 'set'

# Set#filter_map
p(Set[1, 2, 3, 4].filter_map { |x| x * 2 if x.even? })
v581 = Set[1, 2, 3, 4].filter_map { |x| x * 2 if x.even? }; p(v581)
a581 = Set[1, 2, 3]; p(a581.filter_map { |x| nil })
b581 = Set["a", "bb"]; v582 = b581.filter_map { |s| s.upcase if s.length == 1 }; p(v582)
