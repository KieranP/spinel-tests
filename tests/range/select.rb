# frozen_string_literal: true
# Range#select
p((1..5).select(&:even?))
a044 = (1..5); p(a044.select(&:even?))
a045 = (1..5); c045 = (a045.select(&:even?)); p c045
p((1..5).select { |n| n > 2 })
a046 = (1..5); c046 = (a046.select { |n| n > 2 }); p c046
p((1...5).select(&:odd?))
p((5..1).select(&:even?))
p(("a".."e").select { |s| s < "c" })
a047 = ("a".."e"); c047 = (a047.select { |s| s < "c" }); p c047
p((1..3).select.class)
