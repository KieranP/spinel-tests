# frozen_string_literal: true
# Regexp#equal?
a026 = /ab/; p(a026.equal?(a026))
# WONTFIX: See docs/limitations.md - "By design — Unboxed value types: identity IS the value"
# a027 = /ab/; b027 = /ab/; p(a027.equal?(b027))
a028 = /ab/; v028 = a028.equal?(a028); p v028
