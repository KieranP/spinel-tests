# frozen_string_literal: true
# SizedQueue.new
p(SizedQueue.new(2).max)

a001 = SizedQueue.new(2)
p a001.max
p a001.size
p a001.empty?

b002 = 5
a002 = SizedQueue.new(b002)
p a002.max

a003 = SizedQueue.new(3)
c003 = a003.max
p c003.class
p c003

# a capacity of zero or less is an ArgumentError
r004 = (SizedQueue.new(0) rescue $!.class)
p r004
r005 = (SizedQueue.new(-1) rescue $!.class)
p r005

# a fresh queue is empty and open
a006 = SizedQueue.new(1)
p a006.empty?
p a006.closed?
p a006.size
