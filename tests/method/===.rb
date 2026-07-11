# frozen_string_literal: true
# Method#===
def dbl(n) = n * 2

# Method#=== is an alias for #call (returns the method's result).
# `===` on a Method receiver front-end rejects, so all forms are commented.
p(method(:dbl) === 21)
m001 = method(:dbl); v001 = (m001 === 21); p v001
