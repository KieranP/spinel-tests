# frozen_string_literal: true
# Range#begin
p((1..5).begin)
a001 = (1..5); p(a001.begin)
a002 = (1..5); c002 = (a002.begin); p c002
p((..5).begin)
v003 = ((..5).begin); p(v003)
p((1..).begin)
v004 = ((1..).begin); p(v004)
p(("a".."e").begin)
a005 = ("a".."e"); p(a005.begin)

ranges689 = [(1..5), (10..20)]
p ranges689[0].begin + ranges689[0].end

p((1.0..5.0).begin)
p((-Float::INFINITY..Float::INFINITY).begin)
a006 = (nil..nil); v006 = (a006.begin); p v006
p((nil..nil).begin)
p((-Float::INFINITY..5).begin)

# a mixed finite Float / Integer pair truncates the Float endpoint
p((1.5..5).begin)
v007 = ((1.5..5).begin); p v007
p((1.5..5.5).begin)
