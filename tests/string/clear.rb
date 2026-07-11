# frozen_string_literal: true
# String#clear
# clear empties the string in place; the receiver becomes ""
a001 = +"abc"; a001.clear; p a001
a002 = +"hello world"; a002.clear; p a002
a003 = +"abc"; a003.clear; p(a003.length)
a004 = +"abc"; a004.clear; p(a004.empty?)
# clear on an already-empty string
a005 = +""; a005.clear; p a005
# clear on a frozen string raises FrozenError
a006 = "x".freeze; begin; a006.clear; p :nope; rescue FrozenError => e; p e.class; end
# clear returns the receiver itself; consuming that value and calling clear on a
# literal receiver both work
a007 = +"abc"; v007 = a007.clear; p v007
a008 = +"abc"; p(a008.clear.empty?)
p((+"abc").clear)
