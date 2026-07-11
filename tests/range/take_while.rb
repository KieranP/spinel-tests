# frozen_string_literal: true
# Range#take_while
p((1..5).take_while { |x001| x001 < 3 })
a002 = (1..5); p(a002.take_while { |x002| x002 < 3 })
a003 = (1..5); v003 = (a003.take_while { |x003| x003 < 3 }); p v003
p((1..5).take_while { |x004| x004 < 100 })
p((1..5).take_while { |x005| false })
p(("a".."e").take_while { |s006| s006 < "c" })
p((1...5).take_while { |x007| x007 < 3 })
p((1..).take_while { |x008| x008 < 4 })
a009 = (1..); v009 = (a009.take_while { |x009| x009 < 4 }); p v009
