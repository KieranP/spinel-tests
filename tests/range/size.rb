# frozen_string_literal: true
# Range#size
p((1..10).size)
a060 = (1..10); p(a060.size)
a061 = (1...10); c061 = (a061.size); p c061
p((1..).size)
a062 = (1..Float::INFINITY); p(a062.size)
r063 = ((1.0..10.0).size rescue "TypeError"); p r063

p((5..1).size)
p((3...3).size)
p(("a".."e").size)
p((0..10000000000).size)
a064 = (1..); c064 = (a064.size); p c064
r065 = ((1.0...10.0).size rescue $!.class); p r065
