# frozen_string_literal: true
require 'set'

# Set#reduce
p(Set[1, 2, 3].reduce { |acc, x| acc + x })
v781 = Set[1, 2, 3].reduce(10) { |acc, x| acc + x }; p(v781)
a781 = Set[1, 2, 3]; p(a781.reduce(:+))
b781 = Set[1, 2, 3]; v782 = b781.reduce(2, :*); p(v782)

# String elements
c781 = Set["a", "b"]; p(c781.reduce("") { |acc, s| acc + s })
