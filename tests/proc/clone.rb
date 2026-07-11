# frozen_string_literal: true
# Proc#clone
p(->(a) { a }.clone.class)
a001 = ->(a) { a }; b001 = a001.clone; p(b001.class)
c001 = ->(a) { a * 3 }; p(c001.clone.call(4))
v001 = ->(a) { a * 3 }.clone.call(4); p(v001)
pr001 = proc { |a, b| [a, b] }; p(pr001.clone.call(9))
v002 = pr001.clone.call(9); p(v002)
p(->(a) { a }.clone.lambda?)
p(proc { |a| a }.clone.lambda?)
c002 = ->(a) { a }; p(c002.clone == c002)
v003 = c002.clone == c002; p(v003)
# clone preserves frozen state (matches Ruby)
lf001 = ->(a) { a }.freeze; p(lf001.clone.frozen?)
v004 = lf001.clone.frozen?; p(v004)
# clone should return a distinct object
o001 = ->(a) { a }; p(o001.clone.equal?(o001))
v005 = o001.clone.equal?(o001); p(v005)
