# frozen_string_literal: true
# String#to_r
p("3/4".to_r)
a001 = "3/4"; p(a001.to_r)
a002 = "3/4"; v002 = a002.to_r; p v002
# decimal and integer strings
p("0.5".to_r)
p("3".to_r)
# negative and improper
p("-6/4".to_r)
# trailing junk after a valid rational is ignored
p("1.5abc".to_r)
# no leading number -> (0/1)
p("abc".to_r)
p("".to_r)
a003 = "0.5"; v003 = a003.to_r; p v003
