# frozen_string_literal: true
# Symbol#==
p(:foo == :foo)
v001 = (:foo == :foo); p v001
a004 = :foo; p(a004 == :foo)
v002 = (a004 == :foo); p v002
a005 = :foo; b005 = :bar; p(a005 == b005)
v003 = (a005 == b005); p v003
# a Symbol never == a String or nil (cross-type comparison is false)
p(:foo == "foo")
v004 = (:foo == "foo"); p v004
p(:foo == nil)
v005 = (:foo == nil); p v005
a006 = :foo; b006 = "foo"; c006 = (a006 == b006); p c006
