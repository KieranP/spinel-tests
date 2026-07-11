# frozen_string_literal: true
# Array#to_ary

p([1, 2].to_ary)
a001 = [1, 2].to_ary
p a001

p([1.1, 2.2].to_ary)
a002 = [1.1, 2.2].to_ary
p a002

p(["a", "b"].to_ary)
a003 = ["a", "b"].to_ary
p a003

# empty receiver
p([].to_ary)
p((begin; a004 = [].to_ary; a004; rescue => e; e.class; end))

# receiver in a variable
b001 = [1, 2, 3]
p b001.to_ary
c001 = b001.to_ary
p c001
