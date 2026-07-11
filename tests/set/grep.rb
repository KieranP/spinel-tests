# frozen_string_literal: true
require 'set'

# Set#grep
p(Set[1, "a", 2].grep(Integer))
v661 = Set[1, "a", 2].grep(Integer); p(v661)
a661 = Set[1, 2, 3]; p(a661.grep(2..3))
b661 = Set["ab", "cd"]; v662 = b661.grep(/a/); p(v662)
p(Set[1, 2, 3].grep(Integer) { |x| x * 2 })
