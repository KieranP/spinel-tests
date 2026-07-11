# frozen_string_literal: true
# Range#count
p((1..5).count(&:even?))
a001 = (1..5); p(a001.count(&:even?))
a002 = (1..5); c002 = (a002.count(&:even?)); p c002
p((1..5).count)
p((1...5).count)
p((5..1).count)
p((1..5).count(3))
p((1..5).count { |x| x > 2 })
a003 = (1..5); c003 = (a003.count); p c003
p((3..3).count)
p((-3..3).count)
p(("a".."e").count)
p(("a".."e").count { |s| s < "c" })
r004 = ((1.0..5.0).count rescue $!.class); p r004

p((1..5).count(&:odd?))
a005 = (1..); c005 = (a005.size); p c005
p((3...3).count)
p((1..).count)
p((1..Float::INFINITY).count)
