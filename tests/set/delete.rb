# frozen_string_literal: true
require 'set'

# Set#delete
p(Set[1, 2, 3].delete(2).to_a.sort)
a308 = Set[1, 2, 3]; a308.delete(2); p(a308.to_a.sort)
a309 = Set[1, 2, 3]; b309 = 2; a309.delete(b309); p(a309.to_a.sort)
c310 = Set[1, 2, 3]; d310 = (c310.delete(2)); p(d310.to_a.sort)

# deleting an absent element is a no-op
e310 = Set[1, 2, 3]; e310.delete(9); p(e310.to_a.sort)

# String elements
f310 = Set["a", "b", "c"]; f310.delete("b"); p(f310.to_a.sort)
g310 = Set["a", "b"]; h310 = (g310.delete("a")); p(h310.to_a.sort)

# Symbol elements
i310 = Set[:a, :b, :c]; j310 = :c; i310.delete(j310); p(i310.to_a.sort)

# Deleting from a dup of a Set also deletes from the original.
a049 = Set[1, 2]; b049 = a049.dup; b049.delete(1); p(a049.to_a.sort)
a050 = Set[1, 2]; b050 = a050.dup; b050.delete(1); v050 = a050.to_a.sort; p v050

# Array, Struct and nested-Set elements
a095 = Set[[1, 2], [3]]; a095.delete([1, 2]); p(a095.to_a)
b095 = Set[[1, 2]]; c095 = b095.delete([9]); p(c095.to_a)
S095 = Struct.new(:x); d095 = Set[S095.new(1), S095.new(2)]; d095.delete(S095.new(1)); p(d095.map(&:x))
e095 = Set[Set[1], Set[2]]; f095 = e095.delete(Set[1]); p(f095.map { |s| s.to_a })

# Float and Integer elements are distinct
g095 = Set[1, 1.0]; g095.delete(1); p(g095.to_a)
