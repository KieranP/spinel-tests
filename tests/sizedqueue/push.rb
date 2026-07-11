# frozen_string_literal: true
# SizedQueue#push
p(SizedQueue.new(2).push(1).size)

a001 = SizedQueue.new(2)
a001.push(1)
p a001.size
p a001.pop

b002 = "job"
a002 = SizedQueue.new(2)
a002.push(b002)
p a002.pop

a003 = SizedQueue.new(2)
c003 = a003.push(9)
p c003.class
p c003.size
p c003.pop

# push returns the queue, so pushes chain
a004 = SizedQueue.new(3)
a004.push(1).push(2).push(3)
p a004.size
p a004.pop
p a004.pop
p a004.pop
p a004.empty?

# FIFO order across mixed payload types
a005 = SizedQueue.new(4)
a005.push("s")
a005.push(1)
a005.push([2])
a005.push({ "k" => 3 })
p a005.pop
p a005.pop
p a005.pop
p a005.pop

# push blocks while the queue is full until a consumer drains it
a006 = SizedQueue.new(2)
a006.push(1)
a006.push(2)
p a006.size
d006 = []
t006 = Thread.new { 3.times { d006 << a006.pop } }
a006.push(3)
t006.join
p d006
p a006.size

# pushing to a closed queue is a ClosedQueueError
a007 = SizedQueue.new(2)
a007.close
r007 = (a007.push(1) rescue $!.class)
p r007
