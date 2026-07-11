# frozen_string_literal: true
require 'set'

# Set#classify
p(Set[1, 2, 3].classify { |x| x.odd? })
v007 = Set[1, 2, 3].classify { |x| x.odd? }; p(v007)

# classify by remainder; sort inner sets for determinism
p(Set[1, 2, 3, 4, 5, 6].classify { |x| x % 3 }.transform_values { |s| s.to_a.sort })
a007 = Set[1, 2, 3, 4, 5, 6]; b007 = a007.classify { |x| x % 3 }.transform_values { |s| s.to_a.sort }; p(b007)

# String elements classified by length
c007 = Set["a", "bb", "cc", "ddd"]; d007 = c007.classify { |x| x.length }.transform_values { |s| s.to_a.sort }; p(d007)
