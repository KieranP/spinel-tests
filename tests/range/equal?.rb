# frozen_string_literal: true
# Range#equal?
a026 = (1..3); p(a026.equal?(a026))
# WONTFIX: See docs/limitations.md - "By design — Unboxed value types: identity IS the value"
# a027 = (1..3); b027 = (1..3); p(a027.equal?(b027))
a028 = (1..3); v028 = a028.equal?(a028); p v028
