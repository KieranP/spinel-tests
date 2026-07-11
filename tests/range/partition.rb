# frozen_string_literal: true
# Range#partition
p((1..5).partition(&:even?))
a038 = (1..5); p(a038.partition(&:even?))
a039 = (1..5); c039 = (a039.partition(&:even?)); p c039
p((1..5).partition { |n| n > 2 })
a040 = (1...5); c040 = (a040.partition(&:odd?)); p c040
p((5..1).partition(&:even?))
p(("a".."e").partition { |s| s < "c" })
