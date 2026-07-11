# frozen_string_literal: true
require 'set'

# Set#to_set (on Array)
p([1, 2, 2, 3].to_set)
v022 = [1, 2, 2, 3].to_set; p(v022.to_a.sort)

# String elements
p(["a", "b", "b"].to_set.to_a.sort)
a022 = ["x", "y"].to_set; p(a022.to_a.sort)

# Symbol elements
b022 = [:a, :b, :a].to_set; c022 = (b022.to_a.sort); p(c022)

# Set#to_set returns an equal set
d022 = Set[1, 2, 3]; e022 = d022.to_set; p(e022 == d022)

# #to_set on a Set returns the receiver
f022 = Set[1, 2]; p(f022.to_set.equal?(f022))
g022 = Set[1, 2]; h022 = g022.to_set; p(h022.equal?(g022))

# block form
r022 = (Set[1, 2].to_set { |x| x * 2 }.to_a.sort rescue $!.class); p r022
i022 = Set[1, 2]; r023 = (i022.to_set { |x| x * 2 }.to_a.sort rescue $!.class); p r023

# chained #to_set
p([1, 2].to_set.to_set.to_a.sort)
k022 = [1, 2]; l022 = k022.to_set.to_set; p(l022.to_a.sort)

# Range and Hash receivers
p((1..3).to_set.to_a.sort)
m022 = { a: 1 }.to_set; p(m022.to_a)
