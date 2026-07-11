# frozen_string_literal: true
# String#dedup (alias of String#-@)
p("hello".dedup)
a01 = "hello"; p(a01.dedup)
a02 = "hello"; c02 = (a02.dedup); p c02
# dedup returns a frozen string
p("hello".dedup.frozen?)
a03 = "hello"; c03 = (a03.dedup); p c03.frozen?
# equal contents dedup to the same frozen instance
# WONTFIX: See docs/limitations.md - "By design — Unboxed value types: identity IS the value"
# p("hello".dedup.equal?("hello".dedup))
