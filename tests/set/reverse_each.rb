# frozen_string_literal: true
require 'set'

# Set#reverse_each
acc701 = []; Set[1, 2, 3].reverse_each { |x| acc701 << x }; p(acc701)
a701 = Set[1, 2, 3]; v701 = a701.reverse_each.to_a; p(v701)

# String elements
acc702 = []; Set["a", "b"].reverse_each { |s| acc702 << s }; p(acc702)
b701 = Set["a", "b"]; v702 = b701.reverse_each { |s| s }; p(v702.to_a)
