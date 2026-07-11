# frozen_string_literal: true
# String#unicode_normalized?
# WONTFIX: See docs/limitations.md - "By design — String#unicode_normalize"
# p("hello".unicode_normalized?)
# a01 = "hello"; p(a01.unicode_normalized?)
# a02 = "hello"; c02 = (a02.unicode_normalized?(:nfc)); p c02
# p("hello".unicode_normalized?(:nfd))
# p("hello".unicode_normalized?(:nfkc))
