# frozen_string_literal: true
require 'set'

# Set#replace
a326 = Set[1, 2, 3]; a326.replace([4, 5]); p(a326.to_a.sort)
b327 = Set[1, 2, 3]; c327 = Set[7, 8]; b327.replace(c327); p(b327.to_a.sort)
d328 = Set[1]; e328 = (d328.replace([9])); p(e328.to_a.sort)

# Range argument, alongside the Array call sites above
f329 = Set[1]; r329 = (f329.replace(2..4).to_a.sort rescue $!.class); p r329

# Symbol elements
g329 = Set[:a]; h329 = (g329.replace([:b, :c])); p(h329.to_a.sort)
