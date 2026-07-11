# frozen_string_literal: true
# Range#any?
p((1..5).any? { |x001| x001 > 4 })
a002 = (1..5); p(a002.any? { |x002| x002 > 10 })
a003 = (1..5); v003 = (a003.any? { |x003| x003 > 4 }); p v003
p((5..1).any? { |x004| true })
p(("a".."e").any? { |s005| s005 == "c" })
p((1..5).any?)
p((1..5).any?(Integer))
a006 = (1..5); v006 = (a006.any?(2..4)); p v006
