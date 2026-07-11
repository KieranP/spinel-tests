# frozen_string_literal: true
require 'set'

# Set#merge
p(Set[1, 2].merge([3, 4]))
v018 = Set[1, 2].merge([3, 4]); p(v018)

# merge mutates the receiver
a018 = Set[1, 2]; a018.merge([2, 3]); p(a018.to_a.sort)
b018 = Set[1]; c018 = Set[2, 3]; b018.merge(c018); p(b018.to_a.sort)

# String elements
d018 = Set["a"]; e018 = (d018.merge(["b", "c"])); p(e018.to_a.sort)

# Symbol elements
f018 = Set[:a]; g018 = Set[:b, :c]; f018.merge(g018); p(f018.to_a.sort)

# non-enumerable argument raises ArgumentError
r018 = (Set[1, 2].merge(5) rescue $!.class); p r018

# Merging into a dup of a Set also merges into the original.
a047 = Set[1, 2]; b047 = a047.dup; b047.merge(Set[9]); p(a047.to_a.sort)
a048 = Set[1, 2]; b048 = a048.dup; b048.merge(Set[9]); v048 = a048.to_a.sort; p v048

# Range argument, alongside an Array call site
b049 = Set[1]; r049 = (b049.merge(2..4).to_a.sort rescue $!.class); p r049

# Enumerator argument
c049 = Set[9]; r050 = (c049.merge([1, 2].each).to_a.sort rescue $!.class); p r050

# multiple enumerable arguments
d049 = Set[1]; d049.merge([2], Set[3]); p(d049.to_a.sort)
e049 = Set[1]; f049 = e049.merge({ a: 1 }); p(f049.to_a)
