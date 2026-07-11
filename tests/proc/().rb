# frozen_string_literal: true
# Proc#() call shorthand
p(->(a, b) { a + b }.(2, 3))
v004 = ->(a, b) { a + b }.(2, 3); p(v004)
a004 = ->(a, b) { a + b }; p(a004.(2, 3))
v005 = a004.(2, 3); p(v005)
a006 = ->(a, b) { a + b }; args006 = [2, 3]; p(a006.(*args006))
