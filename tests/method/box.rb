# frozen_string_literal: true
# Method#box
def dbl(n) = n * 2

# Method#box returns the namespace box the method belongs to (nil at top level).
# `box` on a Method receiver front-end rejects, so all forms are commented.
p(method(:dbl).box)
m001 = method(:dbl); v001 = m001.box; p v001
