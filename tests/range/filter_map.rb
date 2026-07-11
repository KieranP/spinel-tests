# frozen_string_literal: true
# Range#filter_map
p((1..5).filter_map { |n| n * 2 if n.odd? })
v004 = (1..5).filter_map { |n| n * 2 if n.odd? }; p(v004)
a005 = (1..5); p(a005.filter_map { |n| n * 2 if n.odd? })
a006 = (1...5); c006 = (a006.filter_map { |n| n if n > 2 }); p c006
p((5..1).filter_map { |n| n })
p(("a".."e").filter_map { |s| s.upcase if s < "c" })
