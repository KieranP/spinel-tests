# frozen_string_literal: true
require 'set'

# Set#divide
p(Set[1, 2, 3].divide { |x| x.odd? })
v011 = Set[1, 2, 3].divide { |x| x.odd? }; p(v011)

# 2-arity block
p(Set[1, 2, 3, 4].divide { |x, y| (x - y).abs == 1 }.map { |sub| sub.to_a.sort }.sort)
v101 = Set[1, 2, 3, 4].divide { |x, y| (x - y).abs == 1 }.map { |sub| sub.to_a.sort }.sort; p v101

# 1-arity block dispatched on a Set held in a local variable
s101 = Set[1, 2, 3, 4, 5, 6]; p(s101.divide { |x| x % 3 }.map { |sub| sub.to_a.sort }.sort)
s102 = Set[1, 2, 3, 4, 5, 6]; v102 = s102.divide { |x| x % 3 }.map { |sub| sub.to_a.sort }.sort; p v102

# String elements, 1-arity block (group by length)
s103 = Set["a", "bb", "cc", "ddd"]; p(s103.divide { |x| x.length }.map { |sub| sub.to_a.sort }.sort)
s104 = Set["a", "bb", "cc", "ddd"]; v104 = s104.divide { |x| x.length }.map { |sub| sub.to_a.sort }.sort; p v104

# every element in its own partition
s105 = Set[1, 2, 3]; p(s105.divide { |x| x }.map { |sub| sub.to_a.sort }.sort)

# all elements in a single partition
s106 = Set[1, 2, 3]; p(s106.divide { |x| 0 }.map { |sub| sub.to_a.sort }.sort)
