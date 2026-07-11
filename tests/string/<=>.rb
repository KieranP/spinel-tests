# frozen_string_literal: true
# String#<=>
p("a" <=> "b")
p("b" <=> "a")
p("a" <=> "a")
a001 = "a"; b001 = "b"; p(a001 <=> b001)
a002 = "a"; b002 = "b"; v002 = (a002 <=> b002); p v002
# prefix orders before the longer string
p("ab" <=> "abc")
p("abc" <=> "ab")
# empty string
p("" <=> "a")
p("" <=> "")
# comparison with a non-String yields nil (not an error)
p("a" <=> 1)
p("a" <=> nil)
a003 = "a"; b003 = 1; v003 = (a003 <=> b003); p v003
# case matters (uppercase sorts before lowercase)
p("A" <=> "a")
# embedded NUL: the bytes after the NUL still take part in the comparison
p("a\0b" <=> "a\0c")
a004 = "a\0b"; b004 = "a\0c"; v004 = (a004 <=> b004); p v004
