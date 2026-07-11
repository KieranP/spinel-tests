# frozen_string_literal: true
# Range#max
p((1..5).max)
a028 = (1..5); p(a028.max)
a029 = (1..5); c029 = (a029.max); p c029
p((1..10).max(3))
v006 = ((1..10).max(3)); p(v006)
p((1...5).max)
p((5..1).max)
p(("a".."e").max)
a031 = ("a".."e"); p(a031.max)
a030 = (1..10); b030 = 3; c030 = (a030.max(b030)); p c030
p((1..5).max { |x, y| y <=> x })
p((1...5).max(2))
p((-5..-1).max)
p((1.0..5.0).max)
p((3..3).max)
r032 = ((1..).max rescue $!.class); p r032
r033 = ((1.0...5.0).max rescue $!.class); p r033

p((3...3).max)
p((nil..nil).cover?(3))
a034 = (1..10); v034 = (a034.max(3)); p v034
p((..5).max)
r035 = ((1..5).max(-1) rescue $!.class); p r035
p((..5).max(2))
p(("a".."e").max(2))
r036 = ((1.0..5.0).max(2) rescue $!.class); p r036

# a Float beginning coerces the answer
p((-Float::INFINITY..5).max)
v914 = (-Float::INFINITY..5).max; p v914

# a mixed finite Float / Integer pair truncates the Float endpoint
p((1..5.5).max)
v915 = ((1..5.5).max); p v915
p((1.5..5.5).max)
