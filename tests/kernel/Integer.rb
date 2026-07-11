# frozen_string_literal: true
# Error cases use `rescue` so both interpreters run to completion.

# Kernel#Integer
p(Integer("42"))
c006 = Integer("42"); p(c006)
p(Integer("0xff", 16))
c007 = Integer("0xff", 16); p(c007)
p(Integer("101", 2))
c008 = Integer("101", 2); p(c008)
a003 = "99"; p(Integer(a003))
a004 = "99"; c009 = Integer(a004); p(c009)
p(Integer(3.9))
c040 = Integer(-3.9); p(c040)
p(Integer("1_000"))
p(Integer("-42"))
p(Integer("0b101"))
p(Integer("777", 8))
r002 = (Integer("abc") rescue "ArgumentError"); p r002
r040 = (Integer(nil) rescue $!.class); p r040
r041 = (Integer(42, 10) rescue $!.class); p r041
r042 = (Integer(3.9, 2) rescue $!.class); p r042

# radix prefixes, signs, underscores and surrounding whitespace
p(Integer("0o17"))
c043 = Integer("0o17"); p(c043)
p(Integer("017"))
p(Integer("0X1f"))
p(Integer("0B11"))
p(Integer("-0x1f"))
p(Integer("+42"))
p(Integer("1_0_0"))
p(Integer("  42  "))
p(Integer("42\n"))
p(Integer(" 0x1F "))
c044 = Integer(" 0x1F "); p(c044)

# base 0 reads the prefix; base 16/36 take the bare digits
p(Integer("12", 0))
p(Integer("0b11", 0))
p(Integer("0x1f", 0))
c045 = Integer("0x1f", 0); p(c045)
p(Integer("ff", 16))
p(Integer("z", 36))
c046 = Integer("z", 36); p(c046)

# malformed strings raise
r047 = (Integer("0x") rescue $!.class); p r047
r048 = (Integer("  ") rescue $!.class); p r048
r049 = (Integer("1 2") rescue $!.class); p r049

r050 = (Integer("0d19") rescue $!.class); p r050
c050 = (Integer("0D19") rescue $!.class); p c050

# a non-numeric argument must raise TypeError; Spinel answers a number
r051 = (Integer(true) rescue $!.class); p r051
r052 = (Integer(false) rescue $!.class); p r052
r053 = (Integer(:sym) rescue $!.class); p r053

# a container or a Range raises TypeError; a Hash argument still aborts the C build
r054 = (Integer([1]) rescue $!.class); p r054
r056 = (Integer(1..2) rescue $!.class); p r056
r055 = (Integer({}) rescue $!.class); p r055
class ToInt057; def to_int; 8; end; end
p(Integer(ToInt057.new))
v057 = Integer(ToInt057.new); p v057

# the exception: keyword is consumed as the base argument
p(Integer("abc", exception: false))
c058 = Integer("42", exception: false); p c058
p(Integer("ff", 16, exception: false))
r059 = (Integer(nil, exception: false) rescue $!.class); p r059
# a Rational or Complex argument raises TypeError although Ruby converts it
p(Integer(Rational(4, 2)))
c060 = Integer(Complex(3, 0)); p c060

# A decimal string past 2**63 raises RangeError under the default overflow mode.
# WONTFIX: See docs/limitations.md - "By design — Integer overflow"
# p(Integer("123456789012345678901234567890").class)
