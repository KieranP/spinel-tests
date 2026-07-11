# frozen_string_literal: true
# SizedQueue#<<
p((SizedQueue.new(2) << 1).size)

a001 = SizedQueue.new(2)
a001 << 1
p a001.size
p a001.pop

b002 = "job"
a002 = SizedQueue.new(2)
a002 << b002
p a002.pop

a003 = SizedQueue.new(2)
c003 = (a003 << 9)
p c003.size
p c003.pop

# << returns the queue, so it chains
a004 = SizedQueue.new(3)
a004 << 1 << 2 << 3
p a004.size
p a004.pop
p a004.pop
p a004.pop

# << blocks while full until a consumer drains
a005 = SizedQueue.new(2)
a005 << 1
a005 << 2
d005 = []
t005 = Thread.new { 3.times { d005 << a005.pop } }
a005 << 3
t005.join
p d005

# << to a closed queue is a ClosedQueueError
a006 = SizedQueue.new(2)
a006.close
r006 = ((a006 << 1) rescue $!.class)
p r006
