# frozen_string_literal: true
# Symbol#<=>
p(:abc <=> :abd)
a001 = :abc; p(a001 <=> :abd)
a002 = :abc; b002 = :abd; p(a002 <=> b002)
a003 = :abc; b003 = :abd; c003 = (a003 <=> b003); p c003
# equal and reversed
p(:abc <=> :abc)
v001 = (:abc <=> :abc); p v001
p(:abd <=> :abc)
v002 = (:abd <=> :abc); p v002
# incomparable argument types return nil
p(:abc <=> 5)
v003 = (:abc <=> 5); p v003
p(:abc <=> nil)
v004 = (:abc <=> nil); p v004
# sorting an array of symbols via <=>
p([:banana, :apple, :cherry].sort)
v005 = ([:banana, :apple, :cherry].sort); p v005
p([:b, :a, :c].min)
v006 = ([:b, :a, :c].min); p v006
# a Symbol receiver compared against Strings inside a block yields nil (matches)
p([:a, :b].map { |s001| s001 <=> "a" })
v007 = ([:a, :b].map { |s002| s002 <=> "a" }); p v007
p(:abc <=> "abc")
v008 = (:abc <=> "abc"); p v008
a004 = :abd; b004 = "abc"; c004 = (a004 <=> b004); p c004
