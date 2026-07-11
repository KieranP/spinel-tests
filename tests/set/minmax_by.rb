# frozen_string_literal: true
require 'set'

# Set#minmax_by
p(Set[3, 1, 2].minmax_by { |x| -x })
v461 = Set[3, 1, 2].minmax_by { |x| -x }; p(v461)
a461 = Set["a", "ccc", "bb"]; p(a461.minmax_by { |s| s.length })
b461 = Set[3, 1, 2]; v462 = b461.minmax_by { |x| x % 3 }; p(v462)
