# frozen_string_literal: true
# SizedQueue#closed?
p(SizedQueue.new(2).closed?)

a001 = SizedQueue.new(2)
p a001.closed?
a001.close
p a001.closed?

b002 = 3
a002 = SizedQueue.new(b002)
p a002.closed?

a003 = SizedQueue.new(2)
c003 = a003.closed?
p c003.class
p c003

# a queue with buffered values still reports closed after close
a004 = SizedQueue.new(2)
a004.push(1)
p a004.closed?
a004.close
p a004.closed?
a004.pop
p a004.closed?

# clear does not reopen a closed queue
a005 = SizedQueue.new(2)
a005.push(1)
a005.close
a005.clear
p a005.closed?
p a005.empty?
