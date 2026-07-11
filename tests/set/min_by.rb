# frozen_string_literal: true
require 'set'

# Set#min_by
p(Set[3, 1, 2].min_by { |x| -x })
v441 = Set[3, 1, 2].min_by { |x| -x }; p(v441)
a441 = Set[3, 1, 2]; p(a441.min_by(2) { |x| -x })
b441 = Set["a", "ccc", "bb"]; v442 = b441.min_by { |s| s.length }; p(v442)

# empty set
p(Set[].min_by { |x| x })
p(Set.new([1, 2]).min_by { |x084| [x084] })
v085 = Set.new([1, 2]).min_by { |x085| [-x085, x085] }; p v085
