# frozen_string_literal: true
# Range#find
p((1..5).find { |x001| x001 > 3 })
a002 = (1..5); p(a002.find { |x002| x002 > 3 })
a003 = (1..5); v003 = (a003.find { |x003| x003 > 3 }); p v003
p((1..5).find { |x004| x004 > 100 })
p(("a".."e").find { |s005| s005 > "c" })
p((1..).find { |x006| x006 * x006 > 30 })
a007 = (1..); v007 = (a007.find { |x007| x007 % 7 == 0 }); p v007
