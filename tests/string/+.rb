# frozen_string_literal: true
# String#+
p("a" + "b")
a007 = "a"; p(a007 + "b")
a008 = "a"; b008 = "b"; p(a008 + b008)
a009 = "a"; b009 = "b"; c009 = (a009 + b009); p c009
# empty operands
p("" + "")
p("x" + "")
p("" + "y")
# result is a fresh, unfrozen string even from a frozen receiver
a010 = "x".freeze; p(a010 + "y")
a011 = "x".freeze; c011 = (a011 + "y"); p(c011.frozen?)
# multibyte
p("café" + "☕")
a012 = "café"; b012 = "☕"; c012 = (a012 + b012); p c012
# non-String argument raises TypeError in Ruby
begin; p("a" + 1); rescue TypeError => e; p e.class; end
a013 = "a"; v013 = (begin; a013 + 1; rescue TypeError => e; e.class; end); p v013
tbl342 = [[1000, "M"], [4, "IV"], [1, "I"]]
out342 = ""
tbl342.each { |num342, sym342| out342 += sym342 }
p out342
