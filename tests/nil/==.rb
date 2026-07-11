# frozen_string_literal: true
# NilClass#==
p(nil == nil)
v004 = (nil == nil); p v004
p(nil == false)
v005 = (nil == false); p v005
p(nil == 0)
p(nil == true)
n004 = nil; p(n004 == nil)
v006 = (n004 == nil); p v006
n005 = nil; v007 = (n005 == 0); p v007
# receiver and argument both in variables
n008 = nil; a008 = nil; p(n008 == a008)
n009 = nil; a009 = false; v009 = (n009 == a009); p v009
# nil == against more values
p(nil == "")
p(nil == [])
p(nil == :sym)
# a hash miss equals nil; a present nil value equals nil
h010 = {a: 1, b: nil}
p(h010[:z] == nil)
p(h010[:b] == nil)
p(h010[:a] == nil)
# a nil-or-value method result compared to nil
def maybe011(b); b ? 3 : nil; end
r011 = maybe011(false); p(r011 == nil)
