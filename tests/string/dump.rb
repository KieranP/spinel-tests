# frozen_string_literal: true
# String#dump
p("hello".dump)
a01 = "hello"; p(a01.dump)
a02 = "hello"; c02 = (a02.dump); p c02
# escapes control and quote characters
p("a\tb\nc".dump)
p("say \"hi\"".dump)
p("back\\slash".dump)
# non-printable bytes render as \xNN escapes
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# p("\a\b\e\f\v\0".dump)
# empty string
p("".dump)
p("a#b".dump)
v_hb = ("a#b".dump); p v_hb
p("é".dump)
v_na = ("é".dump); p v_na
# "#" before { is escaped by both
p("a\#{x}".dump)
