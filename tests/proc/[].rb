# frozen_string_literal: true
# Proc#[] call shorthand
p(->(a, b) { a + b }[2, 3])
v006 = ->(a, b) { a + b }[2, 3]; p(v006)
a005 = ->(a, b) { a + b }; p(a005[2, 3])
v007 = a005[2, 3]; p(v007)
a008 = ->(a, b) { a + b }; args008 = [2, 3]; p(a008[*args008])
