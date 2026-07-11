# frozen_string_literal: true
# Rational#to_c
# Compiles, but the Complex real part prints as Float 0.75 not Rational (3/4):
# Complex stores components as mrb_float (limitations.md "Rational precision and Complex components").
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Rational(3,4).to_c).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
a001 = Rational(3,4); v001 = a001.to_c; p v001.class
