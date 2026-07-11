# frozen_string_literal: true
# String#inspect
p("abc".inspect)
a033 = "abc"; p(a033.inspect)
a034 = "abc"; v034 = a034.inspect; p v034
# quotes, backslashes and named escapes
p("a\"b".inspect)
p("a\\b".inspect)
p("a\nb".inspect)
p("a\tb".inspect)
p("multibyte: café ☕".inspect)
a035 = "a\nb"; v035 = a035.inspect; p v035
# non-printable control bytes: Ruby renders \uNNNN (and ESC as \e)
p("\x02".inspect)
p("\x1f".inspect)
p("\x7f".inspect)
p("\e".inspect)
a036 = "\x02"; v036 = a036.inspect; p v036
p("a\#{x}".inspect)
v_hb = ("a\#{x}".inspect); p v_hb
p("a\#$y".inspect)
# a bare "#" not followed by {, $ or @ is left alone
p("a#b".inspect)
p("a#".inspect)
