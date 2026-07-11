# frozen_string_literal: true
require 'set'

# Set#reject
p(Set[1, 2, 3].reject { |x| x > 1 })
v791 = Set[1, 2, 3].reject { |x| x > 1 }; p(v791)
a791 = Set[1, 2, 3]; p(a791.reject { |x| false })
b791 = Set["a", "bb"]; v792 = b791.reject { |s| s.length == 1 }; p(v792)
