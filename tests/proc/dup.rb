# frozen_string_literal: true
# Proc#dup
p(->(a) { a }.dup.class)
a037 = ->(a) { a }; b037 = a037.dup; p(b037.class)
a038 = ->(a) { a }; v038 = a038.dup; p(v038 == a038)
d039 = ->(a) { a * 2 }; p(d039.dup.call(5))
v039 = d039.dup.call(5); p(v039)
p(->(a) { a }.dup.lambda?)
p(proc { |a| a }.dup.lambda?)
# dup should return a distinct object and drop the frozen flag
o040 = ->(a) { a }; p(o040.dup.equal?(o040))
v040 = o040.dup.equal?(o040); p(v040)
lf041 = ->(a) { a }.freeze; p(lf041.dup.frozen?)
v041 = lf041.dup.frozen?; p(v041)
