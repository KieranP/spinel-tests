# frozen_string_literal: true
require 'set'

# Set#drop_while
p(Set[1, 2, 3].drop_while { |x| x < 3 })
v521 = Set[1, 2, 3].drop_while { |x| x < 3 }; p(v521)
a521 = Set[1, 2, 3]; p(a521.drop_while { |x| true })
b521 = Set["a", "bb"]; v522 = b521.drop_while { |s| s.length < 2 }; p(v522)
