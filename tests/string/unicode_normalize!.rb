# frozen_string_literal: true
# String#unicode_normalize!
# WONTFIX: See docs/limitations.md - "By design — String#unicode_normalize"
# (String#unicode_normalize! is rejected at compile time; see the doc entry.)
# p("hello".unicode_normalize!)
# a001 = "hello"; a001.unicode_normalize!; p a001
# a002 = "héllo"; a002.unicode_normalize!(:nfc); p a002
# p("héllo".unicode_normalize!(:nfd))
