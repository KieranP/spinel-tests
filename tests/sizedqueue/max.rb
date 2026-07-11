# frozen_string_literal: true
# SizedQueue#max
p(SizedQueue.new(4).max)

a001 = SizedQueue.new(4)
p a001.max

b002 = 7
a002 = SizedQueue.new(b002)
p a002.max

a003 = SizedQueue.new(4)
c003 = a003.max
p c003.class
p c003

# max is unaffected by pushes and pops
a004 = SizedQueue.new(3)
a004.push(1)
p a004.max
a004.push(2)
p a004.max
a004.pop
p a004.max

# a capacity of one
a005 = SizedQueue.new(1)
p a005.max
c005 = a005.max
p c005
