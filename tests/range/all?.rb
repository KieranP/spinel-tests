# frozen_string_literal: true
# Range#all?
p((1..5).all? { |x001| x001 > 0 })
a002 = (1..5); p(a002.all? { |x002| x002 > 2 })
a003 = (1..5); v003 = (a003.all? { |x003| x003 > 0 }); p v003
p((5..1).all? { |x004| false })
p(("a".."e").all? { |s005| s005 < "z" })
p((1..5).all?)
p((1..5).all?(Integer))
a006 = (1..5); v006 = (a006.all?(2..4)); p v006
