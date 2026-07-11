# frozen_string_literal: true
# String#chr
p("hello".chr)
c148 = ("hello".chr); p c148
# empty string yields an empty string
p("".chr)
# ASCII first character in all four forms
p("abc".chr)
a200 = "abc"; p(a200.chr)
a201 = "abc"; c201 = (a201.chr); p c201
# chr should return the whole leading character, so its bytes are the character's bytes
p("☕abc".chr.bytes)
a202 = "☕abc"; c202 = (a202.chr.bytes); p c202
p("élan".chr.bytes)
a203 = "élan"; c203 = (a203.chr.bytes); p c203
