# frozen_string_literal: true
require 'set'

# Set#max_by
p(Set[3, 1, 2].max_by { |x| -x })
v431 = Set[3, 1, 2].max_by { |x| -x }; p(v431)
a431 = Set[3, 1, 2]; p(a431.max_by(2) { |x| -x })
b431 = Set["a", "ccc", "bb"]; v432 = b431.max_by { |s| s.length }; p(v432)

# empty set
p(Set[].max_by { |x| x })
