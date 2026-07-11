# frozen_string_literal: true
# Range#cover?
p((1..5).cover?(3))
a003 = (1..5); p(a003.cover?(3))
a004 = (1..5); b004 = 3; p(a004.cover?(b004))
a005 = (1..5); b005 = 3; c005 = (a005.cover?(b005)); p c005
p((..5).cover?(3))
v003 = ((..5).cover?(3)); p(v003)
p((1...5).cover?(5))
p((1..5).cover?(5))
p((1..5).cover?(0))
p((1..).cover?(100))
p(("a".."e").cover?("c"))
p(("a".."e").cover?("f"))
p((1..10).cover?(3..8))

ccr = [(10..20)][0]; cvr = (ccr.cover?(15) rescue $!.class); p cvr

p((1..5).cover?(2...6))
p((1..5).cover?(0..4))
p((1..5).cover?(..3))
p((1..5).cover?(3..))
p((1..).cover?(3..5))
p((..5).cover?(1..3))
p((1..5).cover?(:sym))
p((1..5).cover?(nil))
p((1.0..5.0).cover?("x"))
p((nil..nil).cover?(3))
p((-Float::INFINITY..Float::INFINITY).cover?(0))
a006 = (1..10); b006 = (3..8); c006 = (a006.cover?(b006)); p c006
p((1..5).cover?("x"))
v007 = ((1..5).cover?("x")); p v007
p((1..5).cover?([1]))
r007 = ((1..5).cover?([1]) rescue $!.class); p r007
a008 = (1..5); b008 = "x"; p(a008.cover?(b008))
b009 = [1]; r009 = ((1..5).cover?(b009) rescue $!.class); p r009
b010 = (1.0..5.0); r010 = ((1..5).cover?(b010) rescue $!.class); p r010

# a mixed finite Float / Integer pair truncates the Float endpoint, so membership
# below the real beginning is reported as covered
p((1.5..5).cover?(1.2))
v009 = ((1.5..5).cover?(1.2)); p v009
p((1.5..5.5).cover?(1.2))

# aborts the C build, so these stay commented
f900 = ->(r900) { r900.cover?(5) }; p f900.call(1..10)
f901 = ->(r901) { r901.cover?(5) }; v901 = f901.call(1..10); p v901
