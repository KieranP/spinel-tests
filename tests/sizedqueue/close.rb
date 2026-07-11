# frozen_string_literal: true
# SizedQueue#close
p(SizedQueue.new(2).close.closed?)

a001 = SizedQueue.new(2)
a001.close
p a001.closed?

b002 = 3
a002 = SizedQueue.new(b002)
a002.close
p a002.closed?

a003 = SizedQueue.new(2)
c003 = a003.close
p c003.closed?
p c003.size

# close is idempotent
a004 = SizedQueue.new(2)
a004.close
a004.close
p a004.closed?

# buffered values survive close and are still popped in order
a005 = SizedQueue.new(3)
a005.push(1)
a005.push(2)
a005.close
p a005.size
p a005.pop
p a005.pop
p a005.pop
p a005.empty?

# a blocked consumer wakes on close and sees nil
a006 = SizedQueue.new(2)
d006 = []
t006 = Thread.new { d006 << a006.pop }
a006.close
t006.join
p d006
