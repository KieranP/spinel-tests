# frozen_string_literal: true
# String#unicode_normalize
# WONTFIX: See docs/limitations.md - "By design — String#unicode_normalize"
# p("hello".unicode_normalize)
# a01 = "hello"; p(a01.unicode_normalize)
# a02 = "hello"; c02 = (a02.unicode_normalize(:nfc)); p c02
# p("hello".unicode_normalize(:nfd))
# p("hello".unicode_normalize(:nfkc))
