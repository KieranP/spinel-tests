# frozen_string_literal: true
# Symbol#[]
p(:hello[1, 3])
a006 = :hello; p(a006[1, 3])
a007 = :hello; b007 = 1; c007 = (a007[b007, 3]); p c007
p(:hello[1])
v001 = (:hello[1]); p v001
p(:hello[-1])
v002 = (:hello[-1]); p v002
p(:hello[2..4])
v003 = (:hello[2..4]); p v003
p(:hello[/l+/])
v005 = (:hello[/l+/]); p v005
p(:hello[10])
v006 = (:hello[10]); p v006
# negative out-of-range and negative range
p(:hello[-10])
v007 = (:hello[-10]); p v007
p(:hello[-3..-1])
v008 = (:hello[-3..-1]); p v008
# regexp with a numeric capture-group index
p(:hello[/(l+)(o)/, 2])
v009 = (:hello[/(l+)(o)/, 2]); p v009
# multibyte index
p(:café[3])
v010 = (:café[3]); p v010
p(:hello[/(?<y>l+)/, :y])
v011 = (:hello[/(?<y>l+)/, :y]); p v011
p(:hello[/(?<y>l+)/, "y"])
v012 = (:hello[/(?<y>l+)/, "y"]); p v012
