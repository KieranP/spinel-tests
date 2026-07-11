# frozen_string_literal: true
# Error cases use `rescue` so both interpreters run to completion.

# Kernel#Float
p(Float("1.5"))
c004 = Float("1.5"); p(c004)
a001 = "2.5"; p(Float(a001))
a002 = "2.5"; c005 = Float(a002); p(c005)
p(Float(3))
c040 = Float("1e3"); p(c040)
p(Float("-2.5"))
r001 = (Float("x") rescue "ArgumentError"); p r001
r002 = (Float("0x1.8p3") rescue "ArgumentError"); p r002
r040 = (Float(nil) rescue $!.class); p r040

# underscores, surrounding whitespace, and the named specials
p(Float("1_000.5"))
c041 = Float("1_000.5"); p(c041)
p(Float(" 1.5 "))
p(Float("1e400"))
c042 = Float("1e400"); p(c042)
r043 = (Float("Infinity") rescue $!.class); p r043
r044 = (Float("NaN") rescue $!.class); p r044
p(Float(Rational(1, 2)))
c045 = Float(Rational(1, 2)); p(c045)
p(Float(Complex(1.5, 0)))

# a non-numeric argument must raise TypeError; Spinel answers a Float
r046 = (Float(true) rescue $!.class); p r046
r047 = (Float(:s) rescue $!.class); p r047

# a container or a #to_f object aborts the C build
r048 = (Float([1]) rescue $!.class); p r048
class ToF049; def to_f; 1.25; end; end
p(Float(ToF049.new))

# the exception: keyword is refused outright
p(Float("1.5", exception: false))
c050 = Float("x", exception: false); p c050
