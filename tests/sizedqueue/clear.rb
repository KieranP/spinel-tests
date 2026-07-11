# frozen_string_literal: true
# SizedQueue#clear
p(SizedQueue.new(2).push(1).clear.size)

a001 = SizedQueue.new(2)
a001.push(1)
a001.clear
p a001.size
p a001.empty?

b002 = 3
a002 = SizedQueue.new(b002)
a002.push("x")
a002.push("y")
a002.clear
p a002.size

a003 = SizedQueue.new(2)
a003.push(1)
c003 = a003.clear
p c003.size
p c003.empty?

# clearing an already-empty queue is a no-op
a004 = SizedQueue.new(2)
a004.clear
p a004.size
p a004.empty?

# capacity survives a clear, and the queue accepts pushes again
a005 = SizedQueue.new(2)
a005.push(1)
a005.push(2)
a005.clear
p a005.max
a005.push(3)
p a005.size
p a005.pop
