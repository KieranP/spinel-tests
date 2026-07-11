# frozen_string_literal: true
# Rational#equal?
a026 = Rational(1, 2); p(a026.equal?(a026))
# WONTFIX: See docs/limitations.md - "By design — Unboxed value types: identity IS the value"
# a027 = Rational(1, 2); b027 = Rational(1, 2); p(a027.equal?(b027))
a028 = Rational(1, 2); v028 = a028.equal?(a028); p v028
