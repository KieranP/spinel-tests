# frozen_string_literal: true
require 'set'

# Set#subtract
p(Set[1, 2, 3].subtract([2, 3]))
v021 = Set[1, 2, 3].subtract([2, 3]); p(v021)

# subtract mutates the receiver
a021 = Set[1, 2, 3]; a021.subtract([1]); p(a021.to_a.sort)
b021 = Set[1, 2, 3]; c021 = Set[2]; b021.subtract(c021); p(b021.to_a.sort)

# String elements
d021 = Set["a", "b", "c"]; e021 = (d021.subtract(["b"])); p(e021.to_a.sort)

# Symbol elements
f021 = Set[:a, :b, :c]; g021 = Set[:a, :c]; f021.subtract(g021); p(f021.to_a.sort)

# non-enumerable argument raises ArgumentError
r021 = (Set[1, 2].subtract(5) rescue $!.class); p r021

# Range argument, alongside the Array call sites above
h021 = Set[1, 2, 3]; r022 = (h021.subtract(2..3).to_a.sort rescue $!.class); p r022
