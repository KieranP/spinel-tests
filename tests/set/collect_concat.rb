# frozen_string_literal: true
require 'set'

# Set#collect_concat
p(Set[1, 2].collect_concat { |x| [x, -x] })
v821 = Set[1, 2].collect_concat { |x| [x, -x] }; p(v821)
a821 = Set["ab", "c"]; p(a821.collect_concat { |s| s.chars })
b821 = Set[1, 2]; v822 = b821.collect_concat { |x| x }; p(v822)
