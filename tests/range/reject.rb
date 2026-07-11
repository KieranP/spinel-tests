# frozen_string_literal: true
# Range#reject
p((1..5).reject(&:even?))
a042 = (1..5); p(a042.reject(&:even?))
a043 = (1..5); c043 = (a043.reject(&:even?)); p c043
p((1..5).reject { |n| n > 2 })
a044 = (1..5); c044 = (a044.reject { |n| n > 2 }); p c044
p((1...5).reject(&:odd?))
p((5..1).reject(&:even?))
p(("a".."e").reject { |s| s < "c" })
a045 = ("a".."e"); c045 = (a045.reject { |s| s < "c" }); p c045
