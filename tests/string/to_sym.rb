# frozen_string_literal: true
# String#to_sym
p("abc".to_sym)
a001 = "abc"; p(a001.to_sym)
a002 = "abc"; v002 = a002.to_sym; p v002
# symbols with spaces / punctuation inspect with quotes
p("a b".to_sym)
p("with-dash".to_sym)
p("+".to_sym)
# round-trips with Symbol#to_s
a003 = "hello"; p(a003.to_sym.to_s)
a004 = "hello"; v004 = (a004.to_sym == :hello); p v004
