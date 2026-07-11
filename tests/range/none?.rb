# frozen_string_literal: true
# Range#none?
p((1..5).none? { |x001| x001 > 10 })
a002 = (1..5); p(a002.none? { |x002| x002 > 4 })
a003 = (1..5); v003 = (a003.none? { |x003| x003 > 10 }); p v003
p((5..1).none? { |x004| true })
p(("a".."e").none? { |s005| s005 > "z" })
p((1..5).none?)
p((1..5).none?(String))
a006 = (1..5); v006 = (a006.none?(7..9)); p v006
