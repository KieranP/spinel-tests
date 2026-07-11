# frozen_string_literal: true
# NilClass#!=
p(nil != nil)
v001 = (nil != nil); p v001
p(nil != false)
p(nil != 0)
n001 = nil; p(n001 != nil)
n002 = nil; n003 = nil; p(n002 != n003)
n004 = nil; v002 = (n004 != false); p v002
