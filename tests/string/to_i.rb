# frozen_string_literal: true
# String#to_i
p("42".to_i)
a001 = "42"; p(a001.to_i)
a002 = "42"; v002 = a002.to_i; p v002
# trailing non-digits are ignored; leading whitespace and sign allowed
p("  -42abc".to_i)
p("+7".to_i)
# no leading digits -> 0; empty -> 0
p("abc".to_i)
p("".to_i)
# underscores between digits are allowed
p("1_000".to_i)
# explicit base
p("ff".to_i(16))
p("0xff".to_i(16))
p("101".to_i(2))
p("0b101".to_i(2))
p("z".to_i(36))
# base 0 auto-detects the prefix
p("0x1f".to_i(0))
p("0b110".to_i(0))
a003 = "0xff"; b003 = 16; v003 = a003.to_i(b003); p v003
r_b1 = ("12".to_i(1) rescue $!.class); p r_b1
r_b37 = ("12".to_i(37) rescue $!.class); p r_b37
# base 8 / base 0 with an octal prefix
p("0o17".to_i(8))
p("017".to_i(8))
p("0o17".to_i(0))
z001 = "0o17"; v001 = z001.to_i(0); p v001
# a base-16 string without the prefix, and digits invalid for the base
p("ff".to_i(16))
p("129".to_i(8))
p("2".to_i(2))
