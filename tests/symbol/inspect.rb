# frozen_string_literal: true
# Symbol#inspect
p(:hello.inspect)
a015 = :hello; p(a015.inspect)
a016 = :hello; c016 = (a016.inspect); p c016

# a non-ASCII letter is a valid unquoted symbol char in Ruby, so no surrounding quotes
p(:café.inspect)
a017 = :café; c017 = (a017.inspect); p c017

# operator symbols inspect without quotes
p(:+.inspect)
v001 = (:+.inspect); p v001
p(:[].inspect)
v002 = (:[].inspect); p v002
p(:<=>.inspect)
v003 = (:<=>.inspect); p v003
p(:==.inspect)
v004 = (:==.inspect); p v004
# predicate / bang / setter method names
p(:even?.inspect)
v005 = (:even?.inspect); p v005
p(:map!.inspect)
v006 = (:map!.inspect); p v006
p(:foo=.inspect)
v007 = (:foo=.inspect); p v007
# symbols needing quotes (space, leading digit) and sigil symbols
p(:"a b".inspect)
v008 = (:"a b".inspect); p v008
p(:"1x".inspect)
v009 = (:"1x".inspect); p v009
p(:@ivar.inspect)
v010 = (:@ivar.inspect); p v010
p(:$glob.inspect)
v011 = (:$glob.inspect); p v011
