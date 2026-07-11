# frozen_string_literal: true
# Integer#/
p(7 / 2)
a303 = 7; p(a303 / 2)
a304 = 7; b304 = 2; p(a304 / b304)
a305 = 7; b305 = 2; c305 = (a305 / b305); p c305

p(-7 / 2)
p(7 / -2)
p(-7 / -2)
p(6 / 3)
p(0 / 5)
p(7 / 2.0)
a306 = 7; b306 = 2.0; c306 = (a306 / b306); p c306
p((7 / 2.0).class)

p((7 / 0 rescue $!.class))
r307 = (7 / 0 rescue $!.class); p r307

p((2 ** 100) / 2)
a308 = 2 ** 100; c308 = (a308 / 2); p c308

# Rational argument -> exact Rational (both sides)
p(3 / 2r)
a309 = 3; b309 = 2r; c309 = (a309 / b309); p c309

# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((3 / Complex(1, 2)).class)
