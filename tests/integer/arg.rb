# frozen_string_literal: true
# Integer#arg
p(5.arg)
p(0.arg)
p((-5).arg)
p(5.arg.class)
a001 = 5; p(a001.arg)
b001 = -5; c001 = b001.arg; p c001
d001 = 0; c002 = d001.arg; p c002
