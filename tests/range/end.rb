# frozen_string_literal: true
# Range#end
p((1..5).end)
a001 = (1..5); p(a001.end)
a002 = (1..5); c002 = (a002.end); p c002
p((..5).end)
v003 = ((..5).end); p(v003)
p((1..).end)
v004 = ((1..).end); p(v004)
p(("a".."e").end)
a005 = ("a".."e"); p(a005.end)

p((1.0..5.0).end)
p((-Float::INFINITY..5).end)
v007 = ((-Float::INFINITY..5).end); p v007
# a finite Float beginning with an Integer end truncates the Float endpoint
p((1..5.5).end)
v008 = ((1..5.5).end); p v008
a006 = (nil..nil); v006 = (a006.end); p v006
p((nil..nil).end)
p((1..Float::INFINITY).end)
