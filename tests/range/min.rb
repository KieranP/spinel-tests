# frozen_string_literal: true
# Range#min
p((1..5).min)
a032 = (1..5); p(a032.min)
a033 = (1..5); c033 = (a033.min); p c033
p((1..10).min(3))
v007 = ((1..10).min(3)); p(v007)
p((1...5).min)
p((5..1).min)
p(("a".."e").min)
a035 = ("a".."e"); p(a035.min)
a034 = (1..10); b034 = 3; c034 = (a034.min(b034)); p c034
p((1..5).min { |x, y| y <=> x })
p((1...5).min(2))
p((-5..-1).min)
p((1.0..5.0).min)
p((3..3).min)
p((1..).min)
r036 = ((..5).min rescue $!.class); p r036

p((1..5.0).min)
p((3...3).min)
p((..5.0).cover?(1))
a037 = (1..10); v037 = (a037.min(3)); p v037
r038 = ((1..5).min(-1) rescue $!.class); p r038
p((1..).min(3))
p(("a".."e").min(2))
r039 = ((1.0..5.0).min(2) rescue $!.class); p r039

# a mixed finite Float / Integer pair truncates the Float endpoint
p((1.5..5).min)
v040 = ((1.5..5).min); p v040
p((1.5..5.5).min)
