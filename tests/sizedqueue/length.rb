# frozen_string_literal: true
# SizedQueue#length
p(SizedQueue.new(2).length)

a001 = SizedQueue.new(2)
a001.push(1)
p a001.length

b002 = 4
a002 = SizedQueue.new(b002)
a002.push("x")
a002.push("y")
p a002.length

a003 = SizedQueue.new(2)
a003.push(1)
c003 = a003.length
p c003.class
p c003

# length agrees with size throughout
a004 = SizedQueue.new(3)
p a004.length == a004.size
a004.push(1)
a004.push(2)
p a004.length
p a004.length == a004.size
a004.pop
p a004.length
a004.clear
p a004.length
