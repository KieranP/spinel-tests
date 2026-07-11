# frozen_string_literal: true
# String#=~
p("hello" =~ /l/)
a001 = "hello"; p(a001 =~ /l/)
a002 = "hello"; b002 = /l/; p(a002 =~ b002)
a003 = "hello"; b003 = /l/; v003 = (a003 =~ b003); p v003
# match at the start, and no match -> nil
p("hello" =~ /h/)
p("hello" =~ /z/)
a004 = "hello"; v004 = (a004 =~ /z/); p v004
# =~ sets the match globals
"hello" =~ /l(l)/; p($1)
"hello" =~ /(?<x>l+)/; p($~[:x])
# multibyte offset is in characters
p("café" =~ /é/)
r_sa = ("hello" =~ "l" rescue $!.class); p r_sa
# the Regexp on the left-hand side, and the match globals after a miss
p(/l/ =~ "hello")
z001 = "hello"; v001 = (/(?<x>l+)/ =~ z001); p v001; p $~[:x]
"hello" =~ /z/; p $~
