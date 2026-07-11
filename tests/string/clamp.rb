# frozen_string_literal: true
# String#clamp
p("b".clamp("a", "c"))
a001 = "b"; p(a001.clamp("a", "c"))
a002 = "b"; b002 = "a"; c002 = "c"; p(a002.clamp(b002, c002))
a003 = "b"; b003 = "a"; c003 = "c"; d003 = (a003.clamp(b003, c003)); p d003
# below the minimum and above the maximum
p("a".clamp("b", "d"))
p("z".clamp("b", "d"))
# the Range form, inclusive and beginless / endless
p("b".clamp("a".."c"))
p("z".clamp("a".."c"))
p("z".clamp(.."c"))
p("a".clamp("b"..))
a004 = "z"; d004 = (a004.clamp("a".."c")); p d004
r005 = ("b".clamp("a"..."c") rescue $!.class); p r005
r006 = ("b".clamp("c", "a") rescue $!.class); p r006
