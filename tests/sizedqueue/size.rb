# frozen_string_literal: true
# SizedQueue#size
p(SizedQueue.new(2).size)

a001 = SizedQueue.new(2)
p a001.size
a001.push(1)
p a001.size

b002 = 4
a002 = SizedQueue.new(b002)
a002.push("x")
a002.push("y")
p a002.size

a003 = SizedQueue.new(2)
a003.push(1)
c003 = a003.size
p c003.class
p c003

# size tracks pushes and pops but never exceeds max
a004 = SizedQueue.new(3)
p a004.size
a004.push(1)
a004.push(2)
a004.push(3)
p a004.size
p a004.size <= a004.max
a004.pop
p a004.size
a004.pop
a004.pop
p a004.size

# clear resets size to zero
a005 = SizedQueue.new(3)
a005.push(1)
a005.push(2)
a005.clear
p a005.size
