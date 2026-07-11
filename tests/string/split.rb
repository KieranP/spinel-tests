# frozen_string_literal: true
# String#split
p("a,b,c".split(","))
a119 = "a,b,c"; p(a119.split(","))
a120 = "a,b,c"; b120 = ","; p(a120.split(b120))
a121 = "a,b,c"; b121 = ","; c121 = (a121.split(b121)); p c121
# no argument (or nil) splits on runs of whitespace, ignoring leading whitespace
p("  a  b   c ".split)
p("a b  c".split(nil))
a122 = "  a  b   c "; c122 = (a122.split); p c122
# trailing empty fields are dropped by default...
p("a,b,,".split(","))
# ...but kept with a negative limit
p("a,b,,".split(",", -1))
# a positive limit caps the number of fields
p("a,b,c,d".split(",", 2))
p("a,b,c,d".split(",", 0))
# single-space string argument behaves like awk (whitespace) split
p("a b c".split(" "))
# empty-string argument splits into characters
p("abc".split(""))
a123 = "abc"; c123 = (a123.split("")); p c123
# Regexp separator
p("a1b2c".split(/\d/))
p("a1b22c".split(/\d+/))
# Regexp with capture groups includes the captures
p("a1b2c".split(/(\d)/))
a124 = "a1b2c"; c124 = (a124.split(/(\d)/)); p c124
# no separator occurrence yields the whole string
p("abc".split(","))
# multibyte separator and multibyte fields
p("a☕b☕c".split("☕"))
p("café".split(""))
a125 = "a☕b☕c"; c125 = (a125.split("☕")); p c125
p("héllo".split("").length)

# a splatted argument list held in a variable
ss160 = ["-"]
p("a-b".split(*ss160))
vs160 = "a-b".split(*ss160); p vs160
# control: the same argument positionally, and a literal array splatted in place
p("a-b".split("-"))
p("a-b".split(*["-"]))
p("hello".split(",") { |z001| z001 })
v_blk = ("a,b".split(",") { |z002| z002 }); p v_blk
# the block really is called for each field
z003 = []; "a,b,c".split(",") { |f003| z003 << f003.upcase }; p z003
# a limit of 1 returns the whole string, and a limit larger than the field count
p("a,b,c".split(",", 1))
p("a,b,c".split(",", 9))
v_lim = ("a,b,c".split(",", 1)); p v_lim
# leading empty fields are kept, trailing ones are dropped unless the limit is negative
p(",a,,b,".split(","))
p(",a,,b,".split(",", -1))
# an empty-string separator with a limit
p("abc".split("", 2))
# a Regexp separator with a limit and with captures
p("a1b2c".split(/(\d)/, 2))
p("a1b2c".split(/(?<d>\d)/))
# a zero-width lookahead separator
p("hello".split(/(?=l)/))
