# frozen_string_literal: true
# Float#between? (Comparable)
p(3.5.between?(1.0, 5.0))
a001 = 3.5; p(a001.between?(1.0, 5.0))
a002 = 3.5; b002 = 1.0; c002 = 5.0; p(a002.between?(b002, c002))
a003 = 3.5; b003 = 1.0; c003 = 5.0; d003 = (a003.between?(b003, c003)); p d003

# out of range, on the boundary, and Integer bounds
p(0.5.between?(1.0, 5.0))
p(5.5.between?(1.0, 5.0))
p(1.0.between?(1.0, 5.0))
p(5.0.between?(1.0, 5.0))
p(3.5.between?(1, 5))
a004 = 6.0; c004 = (a004.between?(1, 5)); p c004

r880 = (1.5.between?("a", "z") rescue $!.class); p r880
