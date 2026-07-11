# frozen_string_literal: true
# String#encoding
p("hello".encoding.to_s)
a01 = "hello"; p(a01.encoding.to_s)
a02 = "hello"; c02 = (a02.encoding.to_s); p c02
# a literal is UTF-8 by default
p("hello".encoding.name)
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# p("hello".b.encoding.to_s)
