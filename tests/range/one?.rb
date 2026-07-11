# frozen_string_literal: true
# Range#one?
p((1..5).one? { |x001| x001 == 3 })
a002 = (1..5); p(a002.one? { |x002| x002 > 3 })
a003 = (1..5); v003 = (a003.one? { |x003| x003 == 3 }); p v003
p((5..1).one? { |x004| true })
p(("a".."e").one? { |s005| s005 == "c" })
p((1..5).one?)
p((1..5).one?(3..3))
a006 = (1..5); v006 = (a006.one?(2..4)); p v006
