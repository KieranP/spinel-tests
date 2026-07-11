# frozen_string_literal: true
# Range#drop_while
p((1..5).drop_while { |x001| x001 < 3 })
a002 = (1..5); p(a002.drop_while { |x002| x002 < 3 })
a003 = (1..5); v003 = (a003.drop_while { |x003| x003 < 3 }); p v003
p((1..5).drop_while { |x004| true })
p((1..5).drop_while { |x005| false })
p(("a".."e").drop_while { |s006| s006 < "c" })
p((1...5).drop_while { |x007| x007 < 3 })
