# frozen_string_literal: true
# Range#detect
p((1..5).detect { |x001| x001 > 3 })
a002 = (1..5); p(a002.detect { |x002| x002 > 3 })
a003 = (1..5); v003 = (a003.detect { |x003| x003 > 3 }); p v003
p((1..5).detect { |x004| x004 > 100 })
p(("a".."e").detect { |s005| s005 > "c" })
p((1..).detect { |x006| x006 > 3 })
a007 = (1..); v007 = (a007.detect { |x007| x007 > 3 }); p v007
