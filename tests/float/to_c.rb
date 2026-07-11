# frozen_string_literal: true
# Float#to_c
p(3.5.to_c)
a001 = 3.5; p(a001.to_c)
a002 = 3.5; c002 = (a002.to_c); p c002

# negatives, zero, and class of result
p((-2.5).to_c)
p(0.0.to_c)
p(3.5.to_c.class)
a003 = -2.5; c003 = (a003.to_c); p c003
