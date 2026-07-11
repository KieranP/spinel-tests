# frozen_string_literal: true
# Rational#i
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
# #i returns a Complex; only the printed component form differs (Spinel Float, CRuby Rational) — type-check.
p(Rational(3,4).i.class)
a001 = Rational(3,4); v001 = a001.i; p v001.class
p(Rational(-1,2).i.class)
a002 = Rational(-1,2); v002 = a002.i; p v002.class
